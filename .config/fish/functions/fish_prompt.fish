function fish_prompt --description 'Informative prompt'

    set -l last_pipestatus $pipestatus

    set -l time_string (
        set_color $fish_color_prompt
        date "+%H:%M:%S"
    )

    set -l user_string (
        if contains $USER root toor
            set_color brred
        else
            set_color $fish_color_cwd
        end
        echo -n $USER
        set_color $fish_color_prompt
        echo -n ' @ '
        prompt_hostname
    )

    set -l git_string (
        set -x __fish_git_prompt_show_informative_status
        set -x __fish_git_prompt_showcolorhints
        set -x __fish_git_prompt_color $fish_color_prompt
        set -x __fish_git_prompt_color_branch $fish_color_cwd
        set -x __fish_git_prompt_char_stateseparator ' '
        fish_git_prompt '%s'
    )

    set -l python_string
    if set -q VIRTUAL_ENV
        set -l virtualenv_string (
            set -l real_home ~
            set -l virtualenv $VIRTUAL_ENV
            set -l virtualenv (string replace -r '^'"$VIRTUALFISH_HOME/" '' $virtualenv)
            set -l virtualenv (string replace -r '^'"$real_home"'($|/)' '~$1' $virtualenv)
            echo -n '('
            set_color $fish_color_cwd
            echo -n $virtualenv
            set_color $fish_color_prompt
            echo -n ')'
        )
        set python_string (
            set -l python_version (python --version)
            and echo -n $python_version $virtualenv_string
        )
    end

    set -l cwd_string (
        set_color $fish_color_cwd
        prompt_pwd
    )

    set -l pipestatus_string (
        __fish_print_pipestatus '' '' ' · ' \
            (set_color $fish_color_prompt) (set_color -o red) \
            $last_pipestatus
    )

    set -l separator (
        set_color $fish_color_prompt
        echo -n ' · '
    )

    set_color $fish_color_prompt
    string join $separator $time_string $user_string $git_string $python_string $cwd_string $pipestatus_string
    
    set_color normal
    echo -n '> '
end
