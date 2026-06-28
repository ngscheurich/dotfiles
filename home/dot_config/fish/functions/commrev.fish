function commrev --description "Review commits one at a time in hunk"
    set range main..HEAD
    if test (count $argv) -gt 0
        set range $argv[1]
    end

    set commits (git log --reverse --format="%H" $range)
    if test (count $commits) -eq 0
        echo (set_color yellow)"No commits to review"(set_color normal)
        return
    end

    set auto_all false

    for sha in $commits
        set short (git log -1 --format='%h' $sha)
        set subject (git log -1 --format='%s' $sha)

        if test $auto_all = true
            hunk show $sha
            continue
        end

        set prompt (set_color yellow)"Review"(set_color normal)" "(set_color cyan)$short(set_color normal)": $subject "(set_color brblack)"[Y/n/a/q]"(set_color normal)" "

        while true
            read -l -n 1 -P $prompt answer
            echo
            switch $answer
                case Y y ''
                    hunk show $sha
                    break
                case n N
                    break
                case a A
                    set auto_all true
                    hunk show $sha
                    break
                case q Q
                    return
            end
        end
    end
end
