if status is-interactive
    fish_hybrid_key_bindings
    fish_fzy_key_bindings

    abbr -ag lg lazygit

    alias cls clear
    alias dot "git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
    alias fishconfig "$EDITOR $__fish_config_dir/config.fish"
    alias fishsource "source $__fish_config_dir/config.fish"
    alias l exa
    alias ls exa
    alias ll "exa --long"
    alias la "exa --long --all"
    alias lt "exa --tree"
    alias love /Applications/love.app/Contents/MacOS/love
    alias pico8 /Applications/PICO-8.app/Contents/MacOS/pico8
    alias serve "python -m http.server"
    alias ta "tmux attach"
    alias tn "tmuxdir"
    alias vboxls "VBoxManage list runningvms"
    alias vimdiff "nvim -d"
    alias weather "curl wttr.in"
end

function fish_greeting
end

set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx AWS_VAULT_KEYCHAIN_NAME login
set -gx BROWSER open
set -gx EDITOR nvim
set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
set -gx KERL_CONFIGURE_OPTIONS --without-javac
set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket
set -gx RANGER_DEVICONS_SEPARATOR "  "
set -gx XDG_CONFIG_DATA $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config

fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/tools/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/elixir-ls
fish_add_path $HOME/go/bin
fish_add_path /opt/homebrew/bin/
fish_add_path /usr/local/sbin


if test -f $__fish_config_dir/secrets.fish
    source $__fish_config_dir/secrets.fish
end

source $ASDF_DIR/asdf.fish

starship init fish | source
