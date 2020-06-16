function fish_greeting
    set -l suffix
    switch (date '+%-d')
        case 1 21 31
            set suffix 'st'
        case 2 22
            set suffix 'nd'
        case 3 23
            set suffix 'rd'
        case '*'
            set suffix 'th'
    end
    echo -ns \n (date "+%A, %-d$suffix of %B")
    set_color $fish_color_prompt
    echo ' · fish shell'
end
