function repeat --description "Run a command repeatedly until interrupted"
    argparse -s h/help e/every= c/clear -- $argv
    or return

    if set -q _flag_help
        echo "Usage: repeat [-e SECONDS] [-c] COMMAND [ARG...]"
        echo
        echo "Run COMMAND in a loop, sleeping between runs"
        echo
        echo "  -e, --every SECONDS  Sleep between runs (default: 5)"
        echo "  -c, --clear          Clear the screen before each run"
        echo "  -h, --help           Show this message"
        return 0
    end

    if test (count $argv) -eq 0
        echo (set_color red)"repeat: no command given"(set_color normal) >&2
        return 1
    end

    set -l every 5
    if set -q _flag_every
        if not string match -qr '^[0-9]+(\.[0-9]+)?$' -- $_flag_every
            echo (set_color red)"repeat: --every expects a non-negative number, got '$_flag_every'"(set_color normal) >&2
            return 1
        end
        set every $_flag_every
    end

    while true
        set -q _flag_clear; and clear
        eval $argv
        sleep $every
    end
end
