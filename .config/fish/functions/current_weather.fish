function current_weather
    set -l data /tmp/current_weather.json
    set -l cond ""

    switch (jq -r ".weather[0].main" $data)
        case Thunderstorm
            set -l cond ""
        case Drizzle
            set -l cond ""
        case Rain
            set -l cond ""
        case Snow
            set -l cond ""
        case Clear
            set -l cond ""
        case Clouds
            set -l cond ""
    end

    set -l temp (cat $data | jq ".main.temp" | xargs printf "%.*f\n" 0)

    echo "$cond $temp°"
end
