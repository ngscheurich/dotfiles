status is-interactive; or exit

# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Load theme
if test -e "$HOME/.theme/shell.fish"
    source "$HOME/.theme/shell.fish"
end

# Start ssh-agent if not already running
if test -z "$SSH_AUTH_SOCK"
  eval (ssh-agent -c) > /dev/null
  ssh-add ~/.ssh/nick@scheurich.me 2>/dev/null
end

# Initialize shell tools
fzf --fish | source
atuin init fish --disable-up-arrow | source
zoxide init fish | source
starship init fish | source
