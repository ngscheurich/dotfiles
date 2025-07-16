#!/bin/sh

LOCAL_BIN="$HOME/.local/bin"

msg() {
  local BOLD="\033[1m"
  local RESET="\033[0m"
  echo "${BOLD}[dotfiles] \033[$1m$2${RESET}"
}

# Install chezmoi if necessary
if [ ! -f "$LOCAL_BIN/chezmoi" ]; then
  msg 34 "🏠 Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
else
  msg 32 "🏠 Chezmoi detected ✓"
fi

# Install Homebrew if necessary
if [ ! -d /opt/homebrew ]; then
  msg 34 "🍺 Installing Homebrew..."
  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  msg 32 "🍺 Homebrew detected ✓"
fi

# Install run script dependencies
msg 34 "🐚 Installing script dependencies..."
if [ ! -f /opt/homebrew/bin/gum ]; then
  /opt/homebrew/bin/brew install gum
else
  msg 32 "🐚 Script dependencies detected..."
fi

# Initialize and apply chezmoi local state
msg 34 "🎒 Initializing dotfiles..."
"$LOCAL_BIN/chezmoi" init --apply ngscheurich
