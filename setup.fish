# Fish shell script for setting default universal variables

# Set default editor to VS Code
set -Ux EDITOR '/usr/local/bin/code -w'

# Configure less
set -Ux LESS '-RSM'

# Set pyenv and virtualenv dirs
set -Ux PYENV_ROOT "$HOME/.pyenv"
set -Ux VIRTUALFISH_HOME "$HOME/.virtualenvs"

# Configure shell prompt
set -U fish_color_cwd normal
set -U fish_color_cwd_root brred
set -U fish_color_prompt brblack
set -U fish_prompt_pwd_dir_length 20

# Include pyenv dir in search paths
if not contains "$HOME/.pyenv/sbin" $fish_user_paths
    set -U fish_user_paths "$HOME/.pyenv/bin"
end