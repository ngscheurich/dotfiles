#!/usr/bin/env bash

# Initializes my dotfiles
#
# Typically, this script is downloaded and executed on a new computer:
#   sh -c "$(curl -fsLS https://raw.githubusercontent.com/ngscheurich/dotfiles/main/init.sh)"
#
# Usage:
#   init.sh

set -euo pipefail

case "$(uname)-$(uname -m)" in
Darwin-arm64)
  gum_platform="Darwin_arm64"
  homebrew_prefix="/opt/homebrew"
  ;;
Darwin-x86_64)
  gum_platform="Darwin_x86_64"
  homebrew_prefix="/usr/local"
  ;;
Linux-x86_64)
  gum_platform="Linux_amd64"
  homebrew_prefix="/home/linuxbrew/.linuxbrew"
  ;;
Linux-aarch64)
  gum_platform="Linux_arm64"
  homebrew_prefix="/home/linuxbrew/.linuxbrew"
  ;;
*)
  raise "Unsupported platform: $(uname) $(uname -m)"
  ;;
esac

version="1.0.0"
gum_version="0.16.2"
gum_release="gum_${gum_version}_${gum_platform}"
gum_archive="${gum_release}.tar.gz"
gum_sbom="${gum_archive}.sbom.json"
homebrew_bin="${homebrew_prefix}/bin"
script_deps="fish"
local_bin="${HOME}/.local/bin"
chezmoi_state="${HOME}/.local/share/chezmoi"

if [ -n "${TMPDIR:-}" ]; then
  workdir="${TMPDIR%/}/dotfiles"
else
  workdir="/tmp/dotfiles"
fi

# Clean up the working directory no matter how the script exits
trap 'rm -rf "$workdir"' EXIT

if command -v gum >/dev/null 2>&1; then
  gum="$(command -v gum)"
else
  gum="${workdir}/${gum_release}/gum"
fi

echo $gum

# Helpers ------------------------------------------------------------------ {{{
log() {
  level="$1"
  shift
  if [ -x "$gum" ]; then
    "$gum" log --structured --time timeonly -l "$level" "$@"
  else
    echo "[$level]" "$@"
  fi
}

raise() {
  log fatal "$1"
  exit 1
}

is_darwin() {
  test "$(uname)" = "Darwin"
}

check_prereqs() {
  command -v curl >/dev/null 2>&1 || raise "curl is required but was not found"
  command -v git >/dev/null 2>&1 || raise "git is required but was not found"
}

if is_darwin; then
  continue_key="Return"
else
  continue_key="Enter"
fi

wait_user() {
  if [ -x "$gum" ]; then
    "$gum" spin --spinner pulse --title "$1" -- read -r _
  else
    echo "$1"
    read -r _
  fi
}

greeting() {
  intro=$(
    cat <<EOF
# Greetings, wanderer.

You’ve stumbled upon my dotfiles setup script.

## What this script does

This is an automation script that helps me install and configure the
programs I rely on. Namely, it:

1. Installs dependencies for this script to run
2. Installs [chezmoi](https://www.chezmoi.io/)
3. Initializes and applies my current chezmoi state

Additionally, if the platform is Darwin, the macOS command line developer
tools are installed.

## Idempotency

The script attempts to check for and skip any steps that have already been
completed, so don't be (too) wary about running it multiple times.

## Cleanup

The script will make a temporary directory for any files it needs to create
or download, and it will try to clean it up.
EOF
  )

  if [ -x "$gum" ]; then
    title="$($gum style --bold "🎒 ngscheurich/dotfiles")"
    version_label="$($gum style --foreground 212 "v$version")"

    "$gum" style \
      --border-foreground 238 --border double --align center \
      --width 40 --margin "1 1" --padding "1 1" \
      "$title" "$version_label"

    echo "$intro" | "$gum" format

    echo ""
    "$gum" confirm "Shall we proceed?" || exit 0
  else
    echo "🎒 ngscheurich/dotfiles v$version"
    echo ""
    echo "$intro"

    echo ""
    printf "Shall we proceed? [y/N] "
    read -r answer
    case "$answer" in
    [yY]*) ;;
    *) exit 0 ;;
    esac
  fi
}

farewell() {
  echo ""
  if [ -x "$gum" ]; then
    "$gum" confirm "All done! Show system info?" || return 0
    fastfetch
  else
    printf "All done! Show system info? [y/N] "
    read -r answer
    case "$answer" in
    [yY]*) fastfetch ;;
    esac
  fi
}
# }}}

# Gum ------------------------------------------------------------- {{{
download_gum() {
  for file in "$gum_archive" "$gum_sbom" "checksums.txt"; do
    url="https://github.com/charmbracelet/gum/releases/download/v${gum_version}/${file}"
    curl -fsLSO "$url"
  done
}

verify_gum() {
  result=$(sha256sum --check checksums.txt 2>/dev/null)
  echo "$result" | grep -q "$gum_archive" && echo "$result" | grep -q "$gum_sbom"
}

install_gum() {
  icon="🎀"
  # If "$gum" is not an executable file, install gum
  if [ -x "$gum" ]; then
    log info "${icon} Gum detected" path "$gum"
  else
    log info "${icon} Installing gum..."

    download_gum

    if verify_gum; then
      # This makes the gum binary available in the working directory
      tar xzf "$gum_archive"
    else
      raise "Gum artifacts could not be verified"
    fi
  fi
}
# }}}

# macOS command line developer tools ------------------------------ {{{
install_macos_dev_tools() {
  icon="🛠️"
  # If the tools path isn't found, install the tools
  if xcode-select --print-path >/dev/null 2>&1; then
    log info "${icon}  macOS command line developer tools detected" path "$(xcode-select -p)"
  else
    log info "${icon}  Requesting macOS command line developer tools install..."

    # Pause until the tools are installed
    xcode-select --install >/dev/null 2>&1
    wait_user "Requested macOS command line developer tools install. Press ${continue_key} when complete..."
  fi
}
# }}}

# Homebrew ----------------------------------------------------------------- {{{
install_homebrew() {
  icon="🍺"
  # If the Homebrew bin directory doesn't exist, install Homebrew
  if [ -d "$homebrew_bin/brew" ]; then
    log info "${icon} Homebrew detected" path "$homebrew_bin"
  else
    log info "${icon} Installing Homebrew..."

    /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if is_darwin; then
    profile="${ZDOTDIR:-$HOME}/.zprofile"
  else
    profile="${HOME}/.profile"
  fi

  # shellcheck disable=SC2016
  brew_shellenv="eval \"\$(${homebrew_bin}/brew shellenv)\""
  if ! grep -Fxq "$brew_shellenv" "$profile"; then
    echo >>"$profile"
    echo "$brew_shellenv" >>"$profile"
  fi
  eval "$brew_shellenv"
}
# }}}

# mise-en-place ------------------------------------------------------------ {{{
install_mise() {
  icon="🔪"
  path="${local_bin}/mise"

  # If mise doesn't exist at the expected path, install it
  if [ -x "$path" ]; then
    log info "${icon} mise-en-place detected" path "$path"
  else
    log info "${icon} Installing mise-en-place..."
    curl https://mise.run | sh
  fi
}
# }}}

# Script dependencies ------------------------------------------------------ {{{
dep_install() {
  brew install --force "$1"
}

install_script_deps() {
  icon="📦"
  command -v brew >/dev/null 2>&1 || raise "Homebrew is not available"
  brew_ls=$(brew list)

  # Check for any missing deps
  missing=""
  for dep in $script_deps; do
    echo "$brew_ls" | grep -Fxq "$dep" || missing="$missing $dep"
  done

  if [ -z "$missing" ]; then
    log info "${icon} Script dependencies detected" deps "$script_deps"
  else
    log info "${icon} Installing script dependencies..." deps "$script_deps"

    for dep in $missing; do
      dep_install "$dep"
    done
  fi
}
# }}}

# chezmoi ------------------------------------------------------------------ {{{
install_chezmoi() {
  icon="🏠"
  path="${local_bin}/chezmoi"

  # If chezmoi doesn't exist at the expected path, install it
  if [ -f "$path" ]; then
    log info "${icon} Chezmoi detected" path "$path"
  else
    log info "${icon} Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$local_bin"
  fi
}

initialize_chezmoi() {
  icon="🎒"
  # If chezmoi state doesn't exist, initialize and apply it
  if test -d "$chezmoi_state"; then
    log info "${icon} Dotfiles initialized" path "$chezmoi_state"
  else
    log info "${icon} Initializing dotfiles..."
    "PATH=${local_bin}:${PATH} chezmoi" init --apply ngscheurich
  fi
}
# }}}

# Fish --------------------------------------------------------------------- {{{
change_shell_to_fish() {
  icon="🐟"
  fish=$(command -v fish)

  if is_darwin; then
    shell=$(dscl . -read "/Users/${USER}" UserShell | awk '{print $2}')
  else
    shell=$(grep "^${USER}:" /etc/passwd | cut -d: -f7)
  fi

  # If the current shell is not Fish, set it using chsh
  if [ "$shell" = "$fish" ]; then
    log info "${icon} User shell is Fish" path "$fish"
  else
    log info "${icon} Changing user shell to Fish..."

    if ! grep -Fxq "$fish" /etc/shells; then
      echo "$fish" | sudo tee -a /etc/shells
    fi

    chsh -s "$fish"
  fi
}
# }}}

# ==============================================================================
# Main
# ------------------------------------------------------------------------------
main() {
  # Create working directory
  if [ ! -d "$workdir" ]; then mkdir -p "$workdir"; fi
  cd "$workdir" || raise "Could not change directory"

  check_prereqs
  install_gum

  greeting

  # macOS command line developer tools
  if is_darwin; then
    install_macos_dev_tools
  fi

  install_homebrew
  install_mise
  install_script_deps
  install_chezmoi
  change_shell_to_fish
  initialize_chezmoi

  farewell
}

main

# vim:ft=sh:fdm=marker:fdl=0
