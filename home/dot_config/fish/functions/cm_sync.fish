function cm_sync --description "Sync an XDG_CONFIG_HOME directory with chzemoi"
    if test (count $argv) -ne 1
        echo (set_color red)"cm_sync: requires one argument"(set_color normal) >&2
        return 1
    end

    set -l config_dir $argv[1]
    set -l target $CHEZMOI_WORKING_TREE/home/dot_config/$config_dir
    set -l source $XDG_CONFIG_HOME/$config_dir

    rm -rf $target
    cp -R $source $target
end
