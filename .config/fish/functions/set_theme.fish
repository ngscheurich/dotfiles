function set_theme
    set -l path $XDG_DATA_HOME/themes/$argv[1]

    # kitty
    if test -f $path/kitty.conf
        ln -sF $path/kitty.conf $XDG_CONFIG_HOME/kitty/colors.conf
        kitty @ set-colors -c $path/kitty.conf
    end

    # tmux
    if test -f $path/tmux.conf
        # source on startup
        tmux source-file $path/tmux.conf
    end

    # nvim
    if test -f $path/nvim.lua
       nvr -c "luafile $path/nvim.lua"
       ln -sF $path/nvim.lua $XDG_CONFIG_HOME/nvim/plugin/colorscheme.lua 
    end
end
