#!/bin/sh

if [ "${DEBUG_SCRIPTS:-0}" = "1" ]; then
  set -ev
else
  set -e
fi

LOCAL_BIN="$HOME/.local/bin"
HOMEBREW_BIN="/opt/homebrew/bin"

msg() {
  printf "\033[1m[dotfiles] \033[%sm%s\033[0m\n" "$1" "$2"
}

brew() {
  "$HOMEBREW_BIN/brew" "$@"
}

is_installed() {
  brew_ls=$(/opt/homebrew/bin/brew list)
  printf "%s" "$brew_ls" | grep -Fxq "$1"
}

# ----------------------------------------------------------
# Install Homebrew
# ----------------------------------------------------------
install_homebrew() {
  if [ ! -d "$HOMEBREW_BIN" ]; then
    msg 34 "🍺 Installing Homebrew..."
    /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    msg 32 "🍺 Homebrew detected ✓"
  fi
}

# ----------------------------------------------------------
# Install setup dependencies
# ----------------------------------------------------------
install_dependencies() {
  missing=0
  if ! is_installed gum; then missing=1; fi
  if ! is_installed 1password; then missing=1; fi
  if ! is_installed 1password-cli; then missing=1; fi

  if [ "$missing" -eq 1 ]; then
    msg 34 "🐚 Installing setup dependencies..."
    if ! is_installed gum; then brew install gum; fi
    if ! is_installed 1password; then brew install --cask 1password; fi
    if ! is_installed 1password-cli; then brew install --cask 1password-cli; fi
  else
    msg 32 "🐚 Setup dependencies detected ✓"
  fi
}

# ----------------------------------------------------------
# Ensure logged into 1Password
# ----------------------------------------------------------
get_1password_login() {
}
printf "Press Enter to continue..."
read -r _x 

# ----------------------------------------------------------
# Install chezmoi
# ----------------------------------------------------------
install_chezmoi() {
  if [ ! -f "$LOCAL_BIN/chezmoi" ]; then
    msg 34 "🏠 Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
  else
    msg 32 "🏠 Chezmoi detected ✓"
  fi
}

# ----------------------------------------------------------
# Initialize and apply chezmoi state
# ----------------------------------------------------------
initialize_chezmoi() {
  if [ ! -d "$HOME/.local/share/chezmoi" ]; then
    msg 34 "🎒 Initializing dotfiles..."
    "$LOCAL_BIN/chezmoi" init --apply ngscheurich
  else
    msg 32 "🎒 Dotfiles detected ✓"
  fi
}

main() {
  install_homebrew 
  install_dependencies
  install_chezmoi 
  initialize_chezmoi
}

main
