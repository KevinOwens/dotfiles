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

# added by Anaconda2 4.0.0 installer
export PATH="/Users/kevinowens/anaconda/bin:$PATH"
export SPARK_HOME='/usr/local/Cellar/apache-spark/1.6.1/libexec/'
export PYMONGO_SPARK="$HOME/code/mongo-hadoop/spark/src/main/python/pymongo_spark.py"
export MONGO_HADOOP_JAR="/usr/local/Cellar/apache-spark/1.6.1/libexec/lib/mongo-hadoop-spark-1.5.2.jar"
export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell --py-files $PYMONGO_SPARK --jars $MONGO_HADOOP_JAR"
#export PATH="$PATH:$HOME/spark-1.6.0/bin"
#export PYSPARK_DRIVER_PYTHON="ipython"
#export PYSPARK_DRIVER_PYTHON_OPTS="'notebook' pyspark"
export MONGO_PROD_USER="hadoop"
export MONGO_PROD_PWD="Ktr28AKFpEZDK2nz"
