status is-interactive; or exit

# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Initialize shell tools
fzf --fish | source
atuin init fish --disable-up-arrow | source
starship init fish | source
zoxide init fish | source
~/.local/bin/mise activate fish | source

# Customize fzf binds
bind --erase --mode insert ctrl-t
bind --mode insert ctrl-f fzf-file-widget
