# =========================================================
# Z Shell Configuration
# =========================================================
# Author: N. G. Scheurich <nick@scheurich.me>
# Repo: https://github.com/ngscheurich/dotfiles

# ---------------------------------------------------------
# Options
# ---------------------------------------------------------
setopt APPEND_HISTORY         # Sessions should append to the history file (not overwrite)
setopt AUTO_CD                # Avoid having to type `cd` to change directories
setopt CORRECT                # Provide a guess of intended commands when command is invalid
# setopt CORRECT_ALL            # Try to correct all arguments in a line
setopt EXTENDED_HISTORY       # Save extra info (timestamp, exec time) to history file
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt HIST_FIND_NO_DUPS      # Ignore duplicates when searching
setopt HIST_IGNORE_DUPS       # Don’t store duplicates
setopt HIST_REDUCE_BLANKS     # Remove blank lines
setopt HIST_VERIFY            # Show history substitution in prompt instead of auto-exec
setopt INC_APPEND_HISTORY     # Save to history after every command
setopt NO_CASE_GLOB           # Case-insensitive globbing
setopt PROMPT_SUBST           # Expand params, commands, and arithmetic in prompt sequence
setopt SHARE_HISTORY          # All sessions share the history file

# ---------------------------------------------------------
# Environment Variables
# ---------------------------------------------------------
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

export AWS_VAULT_KEYCHAIN_NAME=login
export BROWSER=open
export EDITOR='nvim'
export ERL_AFLAGS='-kernel shell_history enabled'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--color=bg+:0,pointer:1,hl:3,hl+:1,info:2,prompt:4"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_ALT_C_COMMAND='fd --type directory --follow --hidden --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_PATH=$(which fzf)
export GPG_TTY=$(tty)
export GUILE_LOAD_PATH=/usr/local/share/guile/site/3.0
export GUILE_LOAD_COMPILED_PATH=/usr/local/lib/guile/3.0/site-ccache
export GUILE_SYSTEM_EXTENSIONS_PATH=/usr/local/lib/guile/3.0/extensions
export HAXE_STD_PATH=/usr/local/lib/haxe/std
export KERL_CONFIGURE_OPTIONS=--without-javac
export LANG=en_US.UTF-8
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export PAGER=less
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/dev/flutter/bin
export PATH=$PATH:$HOME/elixir-ls
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/Projects/picotool
export PATH=$PATH/usr/local/sbin
export STOW_DIR=$HOME/.dotfiles
export TWEEGO_PATH=$HOME/.local/share/twine/story-formats

HISTFILE=$XDG_DATA_HOME/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#969896'

# ---------------------------------------------------------
# Local Config
# ---------------------------------------------------------
[[ -s "$ZDOTDIR/.localrc" ]] && source "$ZDOTDIR/.localrc"

# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
alias curlh='curl -s -D - -o /dev/null'
alias giga='gigalixir'
alias l='exa'
alias la='exa --long --all'
alias lg='lazygit'
alias ll='exa --long'
alias love='/Applications/love.app/Contents/MacOS/love'
alias ls='exa'
alias pico8='/Applications/PICO-8.app/Contents/MacOS/pico8'
alias serve='python -m http.server'
alias ta='tmux attach'
alias tn='tmuxdir'
alias vboxls='VBoxManage list runningvms'
alias vim='nvim'
alias vimconfig='$EDITOR $HOME/.config/nvim/init.vim'
alias vimdiff='nvim -d'
alias weather='curl wttr.in'
alias zbundle='antibody bundle < .zsh_plugins > .zbundle'
alias zshconfig='$EDITOR $ZDOTDIR/.zshrc'
alias zshsource='source $ZDOTDIR/.zshrc'

# ---------------------------------------------------------
# Functions
# ---------------------------------------------------------
funcs="${XDG_CONFIG_HOME}/zsh/funcs"
fpath=($funcs $fpath)

for file in $funcs/*; do
  autoload $file
done

# ---------------------------------------------------------
# Completions
# ---------------------------------------------------------
# Completers
#
#   - Basic completion (_complete _ignored)
#   - Expansion (_expand)
#   - Correction (_correct)
#   - Approximate completion (_approximate)
#
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/Users/nick/.config/zsh/.zshrc'

# Matchers
#
#   1. No matchers (case-sensitive)
#   2. Case-insensitive (lower matches upper)
#   3. Case-insensitive (upper matches lower)
#   4. Partial-word ('f.b.' -> 'foo.bar')
#
# Substring completion is enabled for 2–4
zstyle ':completion:*' matcher-list '' \
  'm:{[:lower:]}={[:upper:]} l:|=* r:|=*' \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
  'r:|[._-]=** r:|=** l:|=*'

# Colorize completions using default 'ls' colors.
zstyle ':completion:*' list-colors ''

# Enable cursor key navigation of completions menu
zstyle ':completion:*' menu select

zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '-- %d --'

# Completions for asdf
fpath=(${ASDF_DIR}/completions $fpath)

# Load the completions system
autoload -Uz compinit
compinit

# ---------------------------------------------------------
# Keys
# ---------------------------------------------------------
bindkey '^?' backward-delete-char
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

KEYTIMEOUT=5

# ---------------------------------------------------------
# Prompt
# ---------------------------------------------------------
colorize() {
  [[ -n $1 ]] && echo "%F{${2:-default}}$1%f"
}

segmented() {
  local segments
  local color=${PROMPT_SEPARATOR_COLOR:-8}
  local separator=${PROMPT_SEPARATOR:-' :: '}

  local -i i=1
  for segment in $@; do
    if [[ -n $segment ]]; then
      [[ $i != 1 ]] && segments+=$(colorize $separator $color)
      segments+=$segment
      i=$i+1
    fi
  done

  echo $segments
}

set-prompt() {
  local cwd=$(colorize %~ blue)
  local now=$(colorize $(date '+%H:%M:%S'))

  local job_info=''
  if [[ -n $(jobs) ]]; then
    job_info=$(colorize ' ' magenta)
  fi

  local git_info=''
  if git-repo; then
    local branch_name=$(colorize "$(git-branch)" cyan)
    local branch_icon=${PROMPT_GIT_CLEAN:-' '}
    local branch_color=green
    if git-rebase; then
      branch_icon=${PROMPT_GIT_REBASE:-' '}
      branch_color=red
    elif git-dirty; then
      branch_icon=${PROMPT_GIT_DIRTY:-' '}
      branch_color=yellow
    fi
    local branch_status=$(colorize $branch_icon $branch_color)
    git_info="$branch_status $branch_name"
  fi

  top_left=$(segmented $cwd)
  top_right=$(segmented $job_info $git_info $now)

  PROMPT=$'\n'$(prompt-line $top_left $top_right)$'\n'
  PROMPT+=%(?.$(colorize "${PROMPT_INDICATOR:-%#} " green).$(colorize "${PROMPT_INDICATOR:-%#} " red))
}

# setopt no_prompt_{bang,subst} prompt_{cr,percent,sp}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt

# ---
#
CURSOR_BLOCK='\e[1 q'
CURSOR_UNDER='\e[3 q'

zle-keymap-select() {
  case $KEYMAP in
    viins|main) echo -ne $CURSOR_BLOCK;;
    vicmd) echo -ne $CURSOR_UNDER;;
  esac
}

zle -N zle-keymap-select

precmd() {
  echo -ne '\e[1 q'
}

# ---------------------------------------------------------
# Plugins
# ---------------------------------------------------------
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "[info] Generating a new initialization file"

  zgen load junegunn/fzf shell/key-bindings.zsh
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

eval "$(thefuck --alias)"
eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# eval $(docker-machine env)
# source "$(brew --prefix asdf)/asdf.sh"

source /nix/store/1g3sk21fx491pygrcpbr5qb4gqxixjlz-asdf-vm-0.8.1/share/asdf-vm/asdf.sh

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && \
  source "$HOME/.local/share/marker/marker.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U select-word-style
select-word-style bash
