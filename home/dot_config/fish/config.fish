status is-interactive; or exit

# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Add libpq binaries to path
fish_add_path -gm /opt/homebrew/opt/libpq/bin

# Add local executables to path
fish_add_path -gm "$HOME/.local/bin"

# Load theme
if test -e "$HOME/.theme/shell.fish"
    source "$HOME/.theme/shell.fish"
end

# Initialize shell tools
fzf --fish | source
atuin init fish --disable-up-arrow | source
zoxide init fish | source
pay-respects fish --alias | source
starship init fish | source
