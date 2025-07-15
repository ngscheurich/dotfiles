#!/bin/sh

# Initialize dotfiles

LOCAL_BIN="$HOME/.local/bin"

# Install chezmoi if necessary
if ! command -v chezmoi > /dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
fi

"$LOCAL_BIN/chezmoi" init --apply --verbose ngscheurich
