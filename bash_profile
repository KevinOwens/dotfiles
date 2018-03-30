export EDITOR="vim"
export GOBIN=~/go/bin
export PATH=$PATH:$HOME/.dotfiles/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

if [ -f ~/.dotfiles/bash/aliases ]; then
  source ~/.dotfiles/bash/aliases
fi

if [ -f ~/.dotfiles/bash/private_aliases ]; then
  source ~/.dotfiles/bash/private_aliases
fi

if [ -f ~/.dotfiles/bashrc ]; then
  source ~/.dotfiles/bashrc
fi

# Powerline Go
function _update_ps1() {
    PS1="$(~/go/bin/powerline-go -modules "venv,ssh,cwd,perms,git,hg,jobs,exit,root" -cwd-max-depth 5 -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
