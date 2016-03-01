source ~/.dotfiles/bash/aliases

if [ -f ~/.dotfiles/bash/private_aliases ]; then
  source ~/.dotfiles/bash/private_aliases
fi

if [ -f ~/.dotfiles/bashrc ]; then
  source ~/.dotfiles/bashrc
fi

export EDITOR="vim"
