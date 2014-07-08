pathdirs=(
  /usr/local/sbin
  /usr/local/bin
  /Users/luca/bin
  /usr/local/share/python
  /usr/local/share/npm/bin
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$dir:$PATH; done

pathdirs=(
  /Users/luca/bin
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$PATH:$dir; done

ZSH="/Users/luca/.zsh"

# export LSCOLORS=cxhxfxdxbxegxdabagacad

# aliases
export CLICOLOR=1
# alias l='ls'
# alias ldir='ls -d */'
# alias valgrind='valgrind --leak-check=full --show-possibly-lost=no --dsymutil=yes'
# alias grepp='grep --color=auto -H -n -r -e'
# alias gff='git pull --ff-only'
# alias ssh='LC_ALL=en_US.UTF-8 ssh'
alias buildo='cd /Users/luca/Documents/buildo/repo/'
alias gll='git log --oneline --decorate --graph --all'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Antigen
source /Users/luca/.zsh/antigen/antigen.zsh
#  bundles che ho tolto per ora..
#  robbyrussell/oh-my-zsh lib/git.zsh 
antigen bundles <<EOBUNDLES
  git
  osx
  zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen apply

setopt auto_cd
cdpath=()
setopt auto_pushd
setopt rm_star_wait
export EDITOR="vim"

HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt extended_history

LANG=en_US.utf8

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

setopt vi
bindkey -v
bindkey -s '^u' 'cd ..; ls^M'
bindkey -s '^l' 'ls^M'

# Fix home/end
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# search
bindkey "^R" history-incremental-search-backward
bindkey "^[[A" up-line-or-search

# Load the theme
setopt prompt_subst
source $ZSH/agnoster.zsh-theme

# vim readonly
function vles() {
  case $# in
    0 ) vim -u ~/.dotfiles/.lessvimrc -;;
    1 ) vim -u ~/.dotfiles/.lessvimrc -R $1;;
  esac
}

# vagrant
export VAGRANT_HOME=/Volumes/VMs/Vagrant/vagrant.d

# source completions
source ~/.zsh/completions/tmuxinator.zsh
