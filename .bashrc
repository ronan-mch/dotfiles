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
HISTSIZE=100000
HISTFILESIZE=200000
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

# aliases for copying and pasting from cmd line
alias pcp='xclip -selection clipboard'
alias pps='xclip -selection clipboard -o'

alias tmux='tmux -2'

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  RED="\[\033[0;31m\]"
  YELLOW="\[\033[0;33m\]"
  GREEN="\[\033[0;32m\]"
  NO_COLOR="\[\033[0m\]"

PS1="\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
alias config='/usr/bin/git --git-dir=/home/ronan/.cfg --work-tree=/home/ronan'

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

alias config='/usr/bin/git --git-dir=/home/ronan/.cfg/ --work-tree=/home/ronan'
# Alias bundler
function be() {
  echo "bundle exec $@";
  bundle exec $@;
}
function hgrep() {
    echo "history | grep $@";
    history | grep $@;
}
stty -ixon
