# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# See bash(1) for more options

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000
HISTCONTROL=ignoreboth:erasedups
export EDITOR=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -lh'
alias ltr='ls -ltr'

alias zen='cd ~/Code/zendesk/'
alias sandbox='cd ~/Code/sandbox/'

# aliases for copying and pasting from cmd line
alias pcp='xclip -selection clipboard'
alias pps='xclip -selection clipboard -o'

alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
# alias tmux='tmux -2'

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# custom mapping for other binaries
export PATH="$HOME/bin:$PATH"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  RED="\[\033[0;31m\]"
  YELLOW="\[\033[0;33m\]"
  GREEN="\[\033[0;32m\]"
  NO_COLOR="\[\033[0m\]"

PS1="\W$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
alias config='/usr/bin/git --git-dir=/home/ronan/.cfg --work-tree=/home/ronan'
export KAFKA_BROKERS=''
export ACCOUNT_FRAUD_SERVICE_URL=''
export SEGMENT_ANALYTICS_ID=''
export AUTOMATIC_ANSWERS_JWT_SECRET=''
export DDTRACE_DISABLED="true"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/

function lb() {
    today=$(date '+%Y-%m-%d')
    fp="/home/ronan/logbook/${today}.md"
    echo $fp
    if [ ! -f $fp ]; then
        echo "# ${today}" > $fp
    fi
    vim $fp
}
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Alias bundler
function be() {
  echo "bundle exec $@";
  bundle exec $@;
}
function hgrep() {
    echo "history | grep $@";
    history | grep $@;
}
function consul-reset(){
    zdi consul stop
    zdi registrator stop
    docker volume rm consul-data
    zdi consul start
    zdi registrator
}
stty -ixon
alias cat='bat'

function fh() {
    echo "history | fzf";
    history | fzf;
}

function setup() {
    zdi vm start && sleep 2 && zdi services restart && zdi apps restart
}

function teardown() {
    zdi apps stop && zdi services stop && zdi vm stop && sleep 2
}
