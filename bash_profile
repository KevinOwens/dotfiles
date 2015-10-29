source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/private_aliases
source ~/dotfiles/bash/git-prompt.sh
source ~/dotfiles/tmuxinator.bash

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export EDITOR="vim"

YELLOW="\[\033[0;33m\]"
export PS1="================================\n\[\033[01;32m\]\u@\h\[\033[01;34m\] \w$YELLOW \$(__git_ps1) \$\[\033[00m\] "

PATH=$PATH:/usr/local/sbin
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

source /Users/KO/.iterm2_shell_integration.bash
