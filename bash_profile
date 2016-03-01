source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/private_aliases
source ~/dotfiles/bash/git-prompt.sh

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export EDITOR="vim"

source /Users/KO/.iterm2_shell_integration.bash
