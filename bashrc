
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=/Users/utaal/bin:$PATH

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable colors
export CLICOLOR=1

# PS1=': ${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\] (\[\033[01;32m\]\u@\h\[\033[00m\])$(__git_ps1)\n$ '
ARROW=`echo -ne '\x2B\x80' | iconv -f utf-16be`
SOFT_ARROW=`echo -ne '\x2B\x81' | iconv -f utf-16be`
BRANCH_SYM=`echo -ne '\x2B\x60' | iconv -f utf-16be`
COL_USERNAME=`tput setab 6 && tput setaf 0`
COL_USERNAME_ARR=`tput setab 0 && tput setaf 6`
COL_PATH=`tput setab 0 && tput setaf 12`
COL_CLEAR=`tput setab 0 && tput setaf 15`
PS1='$COL_USERNAME \u $COL_USERNAME_ARR$ARROW$COL_PATH \w $COL_USERNAME_ARR$SOFT_ARROW$COL_CLEAR$(__git_ps1)\n$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w (\u@\h) \a\]$PS1"
    ;;
*)
    ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mvimt='mvim --remote-tab'
alias mvims='mvim --servername vim'
alias mvimr='mvim --remote'

alias l='ls'
alias ll='ls -alp'

# Alias
alias sgitc='git svn rebase && git svn dcommit'
alias valgrind='valgrind --leak-check=full --show-possibly-lost=no --dsymutil=yes'
alias ssk='ssh -o TCPKeepAlive=yes'
alias grepp='grep * --color=auto -H -n -r -e'

# git
source /usr/local/etc/bash_completion.d/git-completion.bash

# Only list dirs
alias ldir='ls -d */'

# Push-pop dir magic
# function o {
#   printf '\033[01;38;5;160m| \033[39m'
#   builtin dirs -v | awk '{ printf "%s  \033[01;38;5;160m| \033[39m", $0 }'
#   printf '\n'
# }

alias d="pushd"
alias p="popd"

