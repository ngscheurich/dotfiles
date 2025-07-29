status is-interactive; or exit

# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Add local executables to path
fish_add_path -gmp "$HOME/.local/bin"

# Load theme
source "$HOME/.theme/shell.fish"

# Initialize shell tools
fzf --fish | source
atuin init fish --disable-up-arrow | source
zoxide init fish | source
pay-respects fish --alias | source
starship init fish | source
