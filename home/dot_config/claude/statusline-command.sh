#!/usr/bin/env bash
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
ctx_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
ctx_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
# Share of the current 5-hour session limit consumed (subscriber-only; absent
# until the first API response of a session).
session_used=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')

# 45231 -> "45.2k", 1900000 -> "1.9M", 850 -> "850". A zero tenths digit is
# dropped rather than printed, so round values read "340k" and "1M" instead of
# "340.0k" and "1.0M" — which also makes this usable for window sizes.
fmt_tokens() {
  local whole frac unit
  if [ "$1" -ge 1000000 ]; then
    whole=$(($1 / 1000000))
    frac=$((($1 % 1000000) / 100000))
    unit="M"
  elif [ "$1" -ge 1000 ]; then
    whole=$(($1 / 1000))
    frac=$((($1 % 1000) / 100))
    unit="k"
  else
    printf '%d' "$1"
    return
  fi
  if [ "$frac" -eq 0 ]; then
    printf '%d%s' "$whole" "$unit"
  else
    printf '%d.%d%s' "$whole" "$frac" "$unit"
  fi
}

# Show the full path (home shortened to ~). Once it grows past max_cwd_len,
# abbreviate every directory except the current one to its first letter
# (e.g. ~/Developer/spiritualism -> ~/D/spiritualism). Dotfiles keep their
# leading dot plus the next character (.config -> .c).
max_cwd_len=40
short_cwd="${cwd/#$HOME/\~}"
if [ "${#short_cwd}" -gt "$max_cwd_len" ]; then
  case "$short_cwd" in
  /*)
    lead="/"
    rest="${short_cwd#/}"
    ;;
  *)
    lead=""
    rest="$short_cwd"
    ;;
  esac
  IFS='/' read -ra parts <<<"$rest"
  last=$((${#parts[@]} - 1))
  abbr=""
  for i in "${!parts[@]}"; do
    seg="${parts[i]}"
    if [ "$i" -eq "$last" ]; then
      abbr="${abbr}${seg}"
    elif [ "${seg:0:1}" = "." ]; then
      abbr="${abbr}${seg:0:2}/"
    else
      abbr="${abbr}${seg:0:1}/"
    fi
  done
  short_cwd="${lead}${abbr}"
fi

# Git branch (skip optional locks)
git_branch=""
if git -C "$cwd" rev-parse --is-inside-work-tree --no-optional-locks >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_branch=" $branch"
  fi
fi

# Context usage: absolute tokens against the window, plus the percentage.
# The denominator matters — 34% is ~68k on a 200k model and ~340k on a 1m one,
# and the meaning shifts silently if the session changes model. Absolute
# tokens also answer "will this file fit", which a bare percentage does not.
# Falls back to percentage alone if the token fields haven't populated yet.
ctx_part=""
if [ -n "$ctx_in" ] && [ -n "$ctx_size" ] && [ "$ctx_in" -gt 0 ]; then
  ctx_part=" ctx:$(fmt_tokens "$ctx_in")/$(fmt_tokens "$ctx_size")"
  [ -n "$used" ] && ctx_part="${ctx_part} $(printf '%.0f' "$used")%"
elif [ -n "$used" ]; then
  ctx_part=" ctx:$(printf '%.0f' "$used")%"
fi

# Estimated session cost, client-side. This replaces the old cumulative token
# counter: it carries the same "how much work has this session done" signal,
# survives /compact the same way, applies cache pricing correctly, and costs
# no I/O — the old version rescanned the whole transcript on every assistant
# message, which is slowest exactly when transcripts are largest.
cost_part=""
if [ -n "$cost" ]; then
  cost_part=$(printf ' $%.2f' "$cost")
fi

# Session-remaining progress bar, shown just left of the model. Filled cells
# show how much of the current 5-hour session limit is left and deplete as it
# is consumed; they take a green -> yellow -> red color as the remainder runs
# down. Empty cells stay grey. Built with real escape bytes (via %b) so it can
# be passed through printf %s without the format string re-interpreting it.
bar=""
bar_w=0
if [ -n "$session_used" ]; then
  cells=5
  pct=$(printf '%.0f' "$session_used")
  [ "$pct" -gt 100 ] && pct=100
  remaining=$((100 - pct))
  filled=$(((remaining * cells + 50) / 100))
  empty=$((cells - filled))
  if [ "$remaining" -gt 50 ]; then
    fill_color='\033[37m'
  elif [ "$remaining" -gt 20 ]; then
    fill_color='\033[33m'
  else
    fill_color='\033[31m'
  fi
  fill_str=""
  for ((i = 0; i < filled; i++)); do fill_str+="■"; done
  empty_str=""
  for ((i = 0; i < empty; i++)); do empty_str+="■"; done
  bar=$(printf '%b' "\033[90m${empty_str}${fill_color}${fill_str}\033[0m")
  bar="${bar} "        # gap between bar and model
  bar_w=$((cells + 1)) # plain display width: cells plus the trailing space
fi

# Right-align the model: pad between the left segments and the model so the
# model sits at the terminal's right edge. Claude Code sets $COLUMNS (it
# captures stdout, so tput can't read the width). Padding is computed from the
# plain text lengths, excluding ANSI escapes.
left_plain="${short_cwd}${git_branch}${ctx_part}${cost_part}"
# Claude Code reserves built-in spacing on both sides, so the usable width is
# less than $COLUMNS. It indents the left edge by 2 and truncates at COLUMNS-2.
# Using a margin of 4 leaves a matching 2-column gap before the model, so both
# sides are inset symmetrically.
right_margin=4
cols=$((${COLUMNS:-80} - right_margin))

# Fit segments to the viewport, dropping the least load-bearing first: the bar
# goes before the cost, and the cost before anything else. Context usage and
# the model always survive.
pad=$((cols - ${#left_plain} - bar_w - ${#model}))
if [ "$bar_w" -gt 0 ] && [ "$pad" -lt 1 ]; then
  bar=""
  bar_w=0
  pad=$((cols - ${#left_plain} - ${#model}))
fi
if [ -n "$cost_part" ] && [ "$pad" -lt 1 ]; then
  cost_part=""
  left_plain="${short_cwd}${git_branch}${ctx_part}"
  pad=$((cols - ${#left_plain} - bar_w - ${#model}))
fi
[ "$pad" -lt 1 ] && pad=1

# Build status line with ANSI colors
printf "\033[34m%s\033[0m\033[32m%s\033[0m\033[33m%s\033[0m\033[90m%s\033[0m%*s%s\033[36m%s\033[0m" \
  "$short_cwd" \
  "$git_branch" \
  "$ctx_part" \
  "$cost_part" \
  "$pad" "" \
  "$bar" \
  "$model"
