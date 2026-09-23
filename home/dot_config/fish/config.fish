status is-interactive; or exit

# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Use blinky cursor
set -g fish_cursor_default block blink
set -g fish_cursor_insert line blink
set -g fish_cursor_replace_one underscore blink
set -g fish_cursor_visual block blink

# Initialize shell tools
fzf --fish | source
atuin init fish --disable-up-arrow | source
starship init fish | source
zoxide init fish | source
~/.local/bin/mise activate fish | source

# Customize fzf binds
bind --erase --mode insert ctrl-t
bind --mode insert ctrl-f fzf-file-widget
