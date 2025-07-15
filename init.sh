#!/bin/sh

# Initialize dotfiles

LOCAL_BIN="$HOME/.local/bin"

# Install chezmoi if necessary
if ! command -v chezmoi > /dev/null 2>&1; then
  "[info] Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
fi

# Install Homebrew if necessary
if [ ! -d /opt/homebrew ]; then
  "[info] Installing Homebrew..."
  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install chezmoi template dependencies
"[info] Installing template dependencies..."
brew install 1password 1password-cli gum

# Initialize and apply chezmoi local state
"[info] Initializing dotfiles..."
"$LOCAL_BIN/chezmoi" init --apply ngscheurich
