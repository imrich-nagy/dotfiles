function fish_prompt --description 'Informative prompt'

    set -l last_pipestatus $pipestatus

    set -l time_string (
        set_color $fish_color_prompt
        date '+%H:%M:%S'
    )

    set -l user_string (
        if contains $USER root toor
            set_color $fish_color_cwd_root
        else
            set_color $fish_color_cwd
        end
        echo -n $USER
        set_color $fish_color_prompt
        echo -n ' @ '
        prompt_hostname
    )

    set -l git_string (
        set -x __fish_git_prompt_showdirtystate
        set -x __fish_git_prompt_showstashstate
        set -x __fish_git_prompt_showuntrackedfiles
        set -x __fish_git_prompt_showupstream informative
        set -x __fish_git_prompt_describe_style branch
        set -x __fish_git_prompt_showcolorhints
        set -x __fish_git_prompt_show_informative_status

        set -x __fish_git_prompt_char_cleanstate ''
        set -x __fish_git_prompt_char_dirtystate ' '
        set -x __fish_git_prompt_char_invalidstate ' '
        set -x __fish_git_prompt_char_stagedstate ' '
        set -x __fish_git_prompt_char_stashstate ' '
        set -x __fish_git_prompt_char_stateseparator ''
        set -x __fish_git_prompt_char_untrackedfiles ' '
        set -x __fish_git_prompt_char_upstream_ahead ' ↑'
        set -x __fish_git_prompt_char_upstream_behind ' ↓'
        set -x __fish_git_prompt_char_upstream_diverged ' '
        set -x __fish_git_prompt_char_upstream_equal ' ='
        set -x __fish_git_prompt_char_upstream_prefix ''

        set -x __fish_git_prompt_color $fish_color_prompt
        set -x __fish_git_prompt_color_branch $fish_color_cwd
        set -x __fish_git_prompt_color_dirtystate blue
        set -x __fish_git_prompt_color_stagedstate green
        set -x __fish_git_prompt_color_invalidstate brred
        set -x __fish_git_prompt_color_stashstate yellow
        set -x __fish_git_prompt_color_untrackedfiles red

        set -x __fish_git_prompt_shorten_branch_len 25
        set -x __fish_git_prompt_shorten_branch_char_suffix '...'

        fish_git_prompt 'branch %s'
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
            set -l python_version (python --version &| string lower)
            and echo -n $python_version $virtualenv_string
        )
    end

    set -l cwd_string (
        set_color $fish_color_cwd
        echo -s (prompt_pwd) /
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
