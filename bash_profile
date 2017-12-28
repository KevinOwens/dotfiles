source ~/.dotfiles/bash/aliases

if [ -f ~/.dotfiles/bash/private_aliases ]; then
  source ~/.dotfiles/bash/private_aliases
fi

if [ -f ~/.dotfiles/bashrc ]; then
  source ~/.dotfiles/bashrc
fi

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function exitstatus {

  EXITSTATUS="$?"
  BOLD="\[\033[1m\]"

  YELLOW="\[\033[0;33m\]"
  RED="\[\033[1;31m\]"
  GREEN="\[\e[32;1m\]"
  BLUE="\[\e[34;1m\]"
  OFF="\[\033[m\]"

  PROMPT="[KO: \W ${RED}\$(parse_git_branch)${OFF}"

  if [ "${EXITSTATUS}" -eq 0 ]
  then
    BASE_COLOR="${GREEN}"
  else
    BASE_COLOR="${RED}"
  fi

  PS1="${BOLD}${BASE_COLOR}${PROMPT}${BASE_COLOR}] $ ${OFF}"
}

PROMPT_COMMAND=exitstatus
export EDITOR="vim"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:/usr/local/sbin

