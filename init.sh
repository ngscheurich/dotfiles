#!/bin/bash

if [ -n "${DEBUG_SCRIPTS+x}" ] && [ "$DEBUG_SCRIPTS" -eq 1 ]; then
  set -ev
else
  set -e
fi

LOCAL_BIN="$HOME/.local/bin"
HOMEBREW_BIN="/opt/homebrew/bin"


msg() {
  local BOLD="\033[1m"
  local RESET="\033[0m"
  echo -e "${BOLD}[dotfiles] \033[$1m$2${RESET}"
}

msg 34 "🍺 Installing Homebrew..."
exit 0

# Install Homebrew
if [ ! -d "$HOMEBREW_BIN" ]; then
  msg 34 "🍺 Installing Homebrew..."
  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  msg 32 "🍺 Homebrew detected ✓"
fi

# Install run script dependencies
if [ ! -f /opt/homebrew/bin/gum ] || [ ! -f /opt/homebrew/bin/op ]; then
  msg 34 "🐚 Installing setup dependencies..."
  /opt/homebrew/bin/brew install --cask 1password-cli
  /opt/homebrew/bin/brew install gum
else
  msg 32 "🐚 Setup dependencies detected ✓"
fi

# Halt execution until user presses a key
read -n 1 -rsp "Press any key to continue..."; echo
# if [ "${SHELL##*/}" = "fish" ]; then
#   read -l -P "Press any key to continue..."
# else
#   read -n 1 -rsp "Press any key to continue..."; echo
# fi

# Install chezmoi
if [ ! -f "$LOCAL_BIN/chezmoi" ]; then
  msg 34 "🏠 Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
else
  msg 32 "🏠 Chezmoi detected ✓"
fi

# Initialize and apply chezmoi state
if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  msg 34 "🎒 Initializing dotfiles..."
  "$LOCAL_BIN/chezmoi" init --apply ngscheurich
else
  msg 32 "🎒 Dotfiles detected ✓"
fi
