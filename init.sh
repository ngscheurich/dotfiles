#!/bin/bash
#
# Initializes my dotfiles
#
# Typically, this script is downloaded and executed on a new computer:
#   sh -c "$(curl -fsLS https://raw.githubusercontent.com/ngscheurich/dotfiles/main/init.sh)"
#
# Usage:
#   init.sh
#

set -euo pipefail

case "$(uname)" in
Darwin)
  GUM_PLATFORM="Darwin_arm64"
  ;;
*)
  echo "[fatal] Unsupported platform: $(uname)"
  exit 1
  ;;
esac

VERSION="1.0.0"
GUM_VERSION="0.16.2"
GUM_RELEASE="gum_${GUM_VERSION}_${GUM_PLATFORM}"
GUM_ARCHIVE="${GUM_RELEASE}.tar.gz"
GUM_SBOM="${GUM_ARCHIVE}.sbom.json"
HOMEBREW_BIN="/opt/homebrew/bin"
SCRIPT_DEPS="1password 1password-cli fish"
LOCAL_BIN="${HOME}/.local/bin"
CHEZMOI_STATE="${HOME}/.local/share/chezmoi"

if [ -n "$TMPDIR" ]; then
  WORKDIR="${TMPDIR%/}/dotfiles"
else
  WORKDIR="/tmp/dotfiles"
fi

if command -v gum >/dev/null 2>&1; then
  GUM="$(command -v gum)"
else
  GUM="${WORKDIR}/${GUM_RELEASE}/gum"
fi

# Helpers ------------------------------------------------------------------ {{{
log() {
  if [ -x "$GUM" ]; then
    level="$1"
    shift
    "$GUM" log --structured --time timeonly -l "$level" "$@"
  else
    echo "[$1]" "$@"
  fi
}

raise() {
  log fatal "$1"
  exit 1
}

is_darwin() {
  test "$(uname)" = "Darwin"
}

if is_darwin; then
  CONTINUE_KEY="Return"
else
  CONTINUE_KEY="Enter"
fi

wait_user() {
  if [ -x "$GUM" ]; then
    "$GUM" spin --spinner pulse --title "$1" -- read -r _
  else
    echo "$1"
    read -r _
  fi
}

greeting() {
  title="$($GUM style --bold "🎒 ngscheurich/dotfiles")"
  version="$($GUM style --foreground 212 "v$VERSION")"

  "$GUM" style \
    --border-foreground 238 --border double --align center \
    --width 40 --margin "1 1" --padding "1 1" \
    "$title" "$version"

  "$GUM" format <<EOF
# Greetings, wanderer.

You’ve stumbled upon my dotfiles setup script.

## What this script does

This is an automation script that helps me install and configure the programs I
rely on. Namely, it:

1. Installs dependencies for this script to run
2. Installs [chezmoi](https://www.chezmoi.io/)
3. Ensures a 1Password user is active (for chezmoi templates)
4. Initializes and applies my current chezmoi state

Additionally, if the platform is Darwin (macOS), a couple of additional
programs are installed:

- macOS command line developer tools
- Homebrew

## Idempotency

The script attempts to check for and skip any steps that have already been
completed, so don't be (too) wary about running it multiple times.

## Cleanup

The script will make a temporary directory for any files it needs to create or
download, and it will try to clean it up.
EOF

  echo ""
  "$GUM" confirm "Shall we proceed?" || exit 0
}

farewell() {
  echo ""
  "$GUM" confirm "All done! Show system info?" && fastfetch || exit 0
}
# }}}

# Gum ------------------------------------------------------------- {{{
download_gum() {
  for file in "$GUM_ARCHIVE" "$GUM_SBOM" "checksums.txt"; do
    url="https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/${file}"
    curl -fsLSO "$url"
  done
}

verify_gum() {
  result=$(sha256sum --check checksums.txt 2>/dev/null)
  echo "$result" | grep -q "$GUM_ARCHIVE" && echo "$result" | grep -q "$GUM_SBOM"
}

install_gum() {
  icon="🎀"
  # If "$GUM" is not an executable file, install gum
  if [ -x "$GUM" ]; then
    log info "${icon} Gum detected." path "$GUM"
  else
    log info "${icon} Installing gum."

    download_gum

    if verify_gum; then
      # This makes the gum binary available in the working directory
      tar xzf "$GUM_ARCHIVE"
    else
      raise "Gum artifacts could not be verified."
    fi
  fi
}
# }}}

# macOS command line developer tools ------------------------------ {{{
install_macos_dev_tools() {
  icon="🛠️"
  # If the tools path isn't found, install the tools
  if xcode-select --print-path >/dev/null 2>&1; then
    log info "${icon}  macOS command line developer tools detected." path "$(xcode-select -p)"
  else
    log info "${icon}  Requesting macOS command line developer tools install..."

    # Pause until the tools are installed
    xcode-select --install >/dev/null 2>&1
    wait_user "Requested macOS command line developer tools install. Press ${CONTINUE_KEY} when complete..."
  fi
}
# }}}

# Homebrew ----------------------------------------------------------------- {{{
install_homebrew() {
  icon="🍺"
  # If the Homebrew bin directory doesn't exist, install Homebrew
  if [ -d "$HOMEBREW_BIN" ]; then
    log info "${icon} Homebrew detected." path "$HOMEBREW_BIN"
  else
    log info "${icon} Installing Homebrew..."

    /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  zprofile="${ZDOTDIR-$HOME}/.zprofile"
  echo >>"$zprofile"
  # shellcheck disable=SC2016
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
}
# }}}

# Script dependencies ------------------------------------------------------ {{{
dep_installed() {
  brew_ls=$(brew list)
  echo "$brew_ls" | grep -Fxq "$1"
}

dep_install() {
  brew install --force "$1"
}

install_script_deps() {
  icon="📦"
  deps_missing=0

  # Check for any missing deps
  for dep in $SCRIPT_DEPS; do
    if ! dep_installed "$dep"; then deps_missing=1; fi
  done

  # If any deps are missing, install them
  if [ "$deps_missing" -eq 0 ]; then
    log info "${icon} Script dependencies detected." deps "$SCRIPT_DEPS"
  else
    log info "${icon} Installing script dependencies..." deps "$SCRIPT_DEPS"

    for dep in $SCRIPT_DEPS; do
      if ! dep_installed "$dep"; then
        dep_install "$dep"
      fi
    done
  fi
}
# }}}

# chezmoi ------------------------------------------------------------------ {{{
install_chezmoi() {
  icon="🏠"
  path="${LOCAL_BIN}/chezmoi"

  # If chezmoi doesn't exist at the expected path, install it
  if [ -f "$path" ]; then
    log info "${icon} Chezmoi detected." path "$path"
  else
    log info "${icon} Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$LOCAL_BIN"
  fi
}

initialize_chezmoi() {
  icon="🎒"
  # If chezmoi state doesn't exist, initialize and apply it
  if test -d "$CHEZMOI_STATE"; then
    log info "${icon} Dotfiles initialized." path "$CHEZMOI_STATE"
  else
    log info "${icon} Initializing dotfiles..."
    "${LOCAL_BIN}/chezmoi" init --apply ngscheurich
  fi
}
# }}}

# 1Password ---------------------------------------------------------------- {{{
op_logged_in() {
  "$HOMEBREW_BIN/op" whoami >/dev/null 2>&1
}

get_op_login() {
  icon="🔑"

  # Try to get current user
  name=$(op user get --me --format=json | sed -n 's/ *"name": "\([^"]*\)".*/\1/p')

  # If no user found, prompt for login
  if [ -z "$name" ]; then
    log warn "${icon} 1Password account not found."
    wait_user "Configure a 1Password account for use with the CLI, then press ${CONTINUE_KEY}..."

    # Try to get current user again
    name=$(op user get --me --format=json | sed -n 's/ *"name": "\([^"]*\)".*/\1/p')
  fi

  # If name is blank, we were unable to login with the token
  if [ -n "$name" ]; then
    log info "${icon} 1Password account found." name "$name"
  else
    raise "Unable to get 1Password account."
  fi
}
# }}}

# Fish --------------------------------------------------------------------- {{{
change_shell_to_fish() {
  icon="🐟"
  shell=$(dscl . -read "/Users/${USER}" UserShell | awk '{print $2}')
  fish=$(command -v fish)

  # If the current shell is not Fish, set it using chsh
  if [ "$shell" = "$fish" ]; then
    log info "${icon} User shell is Fish." path "$fish"
  else
    log info "${icon} Changing user shell to Fish..."
    echo "$fish" | sudo tee -a /etc/shells
    chsh -s "$fish"
  fi
}
# }}}

# ==============================================================================
# Main
# ------------------------------------------------------------------------------
main() {
  # Create working directory
  if [ ! -d "$WORKDIR" ]; then mkdir -p "$WORKDIR"; fi
  cd "$WORKDIR" || raise "Could not change directory"

  install_gum

  # Display greeting
  greeting

  # macOS setup
  if is_darwin; then
    install_macos_dev_tools
    install_homebrew
  fi

  install_script_deps
  install_chezmoi
  get_op_login
  change_shell_to_fish
  initialize_chezmoi

  # Display farewell
  farewell

  # Clean up working directory
  rm -rf "$WORKDIR"
}

main

# vim:ft=sh:fdm=marker:fdl=0
