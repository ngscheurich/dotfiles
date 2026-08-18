function __repeat_needs_command --description "True until the command word has been given"
    set -l toks (commandline -cxp)
    set -e toks[1]
    set -l skip 0
    for t in $toks
        if test $skip -eq 1
            set skip 0
            continue
        end
        switch $t
            case -e --every
                set skip 1
            case '-*'
                # a flag of ours; keep looking
            case '*'
                return 1
        end
    end
    return 0
end

complete -c repeat -f

complete -c repeat -n __repeat_needs_command -s h -l help -d "Show help"
complete -c repeat -n __repeat_needs_command -s c -l clear -d "Clear the screen before each run"
complete -c repeat -n __repeat_needs_command -s e -l every -x -d "Seconds to sleep between runs"

complete -c repeat -a "(__fish_complete_subcommand -e --every)"
