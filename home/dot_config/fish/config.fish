status is-interactive; or exit

# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Load theme
if test -e "$HOME/.theme/shell.fish"
    source "$HOME/.theme/shell.fish"
end

# Initialize shell tools
fzf --fish | source
atuin init fish --disable-up-arrow | source
zoxide init fish | source
starship init fish | source

# Customize key binds
bind --erase --mode insert ctrl-f
bind --erase --mode insert ctrl-b
bind --erase --mode insert ctrl-t
bind --mode insert ctrl-f fzf-file-widget
