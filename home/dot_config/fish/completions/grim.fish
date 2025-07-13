complete -c grim -s h -l help -d 'Print usage information'
complete -c grim -x -a '(for file in $HOME/.local/share/grimoire/*.sh; basename $file .sh; end)'

