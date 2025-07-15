#!/bin/sh

BLUE="\033[34m"
BOLD="\033[1m"
RESET="\033[0m"
LOCAL_BIN="$HOME/.local/bin"

log() {
  echo -e "${BOLD}${BLUE}$1 $2${RESET}"
}

# Install chezmoi if necessary
if ! command -v chezmoi > /dev/null 2>&1; then
  log "🏠 Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
fi

# Install Homebrew if necessary
if [ ! -d /opt/homebrew ]; then
  log "🍺 Installing Homebrew..."
  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install chezmoi template dependencies
log "🍻 Installing chezmoi template dependencies..."
brew install 1password 1password-cli gum

# Initialize and apply chezmoi local state
log "🎒 Initializing dotfiles..."
"$LOCAL_BIN/chezmoi" init --apply ngscheurich
