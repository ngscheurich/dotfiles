#!/bin/sh

# Initialize dotfiles

# Install chezmoi if necessary
if ! command -v chezmoi > /dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
fi

chezmoi init --apply --verbose https://github.com/ngscheurich/dotfiles.git
