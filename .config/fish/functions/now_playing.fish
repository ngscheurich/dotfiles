function now_playing
    set -l spotify_status (spotify status | head -n 1)
    set icon " "

    if ! set -q spotify_status
        return 1
    else if test -n (string match -r ".*paused." $spotify_status)
        set icon " "
    end

    set -l artist (spotify status artist)

    if test $artist = "The Mountain Goats"
        set -l artist "the Mountain Goats"
    end

    echo $icon (spotify status track) - $artist
end
