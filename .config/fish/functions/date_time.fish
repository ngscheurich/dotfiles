function date_time
    set -l day (string replace " " 0 (date +"%e"))
    echo (date +"%a %b") $day (date +"%H:%M")
end
