# Fish shell script for setting default universal variables

# Print commands when executing
set -l fish_trace 1

# Set default editor to VS Code
set -Ux EDITOR '/usr/local/bin/code -w'

# Use bat as man pager
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Configure less
set -Ux LESS '-RSM'

# Configure prompt
set -U fish_color_cwd normal
set -U fish_color_cwd_root brred
set -U fish_color_prompt brblack
set -U fish_prompt_pwd_dir_length 20

# Set up pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# Set up virtualfish
set -Ux VIRTUALFISH_HOME "$HOME/.virtualenvs"
