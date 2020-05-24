function fish_greeting
    echo
    set_color $fish_color_prompt
    echo 'Hi, welcome back.'
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
    echo -n 'Today is '
    set_color normal
    echo -n (date "+%A, %-d$suffix of %B")
    set_color $fish_color_prompt
    echo .
    echo
end
