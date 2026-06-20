function loc_ratio --description "Show comment vs. code LOC percentages using tokei"
    # ANSI styles
    set -l cyan    (printf '\033[36m')
    set -l white   (printf '\033[97m')
    set -l blue    (printf '\033[34m')
    set -l red     (printf '\033[31m')
    set -l green   (printf '\033[36m')
    set -l magenta (printf '\033[95m')
    set -l dim     (printf '\033[90m')
    set -l reset   (printf '\033[0m')
    set -l bold    (printf '\033[1m')

    # Run tokei
    set -l json (tokei $argv --output json 2>/dev/null)
    if test $status -ne 0; or test -z "$json"
        echo "loc_ratio: tokei failed or produced no output" >&2
        return 1
    end

    # Extract totals from JSON
    set -l code     (echo $json | grep -o '"code":[0-9]*'     | awk -F: '{s+=$2} END{print s}')
    set -l comments (echo $json | grep -o '"comments":[0-9]*' | awk -F: '{s+=$2} END{print s}')
    if test -z "$code" -o -z "$comments"
        echo "loc_ratio: could not parse JSON output from tokei" >&2
        return 1
    end

    set -l total (math "$code + $comments")
    if test "$total" -eq 0
        echo "loc_ratio: no code or comment lines found"
        return 0
    end

    # Compute percentages
    set -l code_pct    (math --scale=1 "$code     * 100 / $total")
    set -l comment_pct (math --scale=1 "$comments * 100 / $total")

    # Lay out dimensions
    set -l SEP_W 57
    set -l LBL_W 20
    set -l BAR_W (math "$SEP_W - $LBL_W")   # 37

    set -l code_w    (math --scale=0 "round($BAR_W * $code / $total)")
    set -l comment_w (math "$BAR_W - $code_w")

    set -l bar \
        $green(string repeat -n $code_w "█")$red(string repeat -n $comment_w "█")$reset

    # Render
    set -l sep (string repeat -n $SEP_W "━")

    echo $sep
    printf "%b %-18s %16s %16s%b\n" \
        "$bold$blue" "Metric" "Code" "Comments" "$reset"
    echo $sep
    printf " %b%-18s%b %b%16s%b %b%16s%b\n" \
        "$bold$magenta" "Lines" "$reset" "$white" $code "$reset" "$white" $comments "$reset"
    printf " %b%-18s%b %b%15s%%%b %b%15s%%%b\n" \
        "$bold$magenta" "Share" "$reset" "$green" $code_pct "$reset" "$red" $comment_pct "$reset"
    echo (printf "$dim")$sep(printf "$reset")
    printf " %b%-18s%b %s\n" \
        "$bold$magenta" "Distribution" "$reset" $bar
    echo $sep
end

