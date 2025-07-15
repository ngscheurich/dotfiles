#!/bin/sh

LOCAL_BIN="$HOME/.local/bin"

msg() {
  local BOLD="\033[1m"
  local RESET="\033[0m"
  echo "${BOLD}\033[$1m$2${RESET}"
}


# Install chezmoi if necessary
if [ ! -f "$LOCAL_BIN/chezmoi" ]; then
  msg 33 "🏠 Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
else
  msg 32 "🏠 Chezmoi detected ✓"
fi

# Install Homebrew if necessary
if [ ! -d /opt/homebrew ]; then
  msg 33 "🍺 Installing Homebrew..."
  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  msg 32 "🍺 Homebrew detected ✓"
fi

# Install chezmoi template dependencies
log "🍻 Installing chezmoi template dependencies..."
brew install 1password 1password-cli gum

# Initialize and apply chezmoi local state
log "🎒 Initializing dotfiles..."
"$LOCAL_BIN/chezmoi" init --apply ngscheurich
