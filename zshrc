pathdirs=(
  /usr/local/sbin
  /usr/local/bin
  /Users/utaal/bin
  /usr/local/share/python
  /Users/utaal/.cabal/bin
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$dir:$PATH; done

pathdirs=(
  /Users/utaal/Apps/bin
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$PATH:$dir; done

ZSH="/Users/utaal/.zsh"

# aliases
alias ldir='ls -d */'
alias sgitc='git svn rebase && git svn dcommit'
alias valgrind='valgrind --leak-check=full --show-possibly-lost=no --dsymutil=yes'
alias ssk='ssh -o TCPKeepAlive=yes'
alias grepp='grep --color=auto -H -n -r -e'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Antigen
source /Users/utaal/.zsh/antigen/antigen.zsh
antigen bundles <<EOBUNDLES
  robbyrussell/oh-my-zsh lib/git.zsh 
  git
  zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen apply

# plugins=(git osx vagrant urltools)

# Load the theme
setopt prompt_subst
source $ZSH/powerline.zsh-theme

# vim readonly
function vles() {
  case $# in
    0 ) vim -u ~/.dotfiles/.lessvimrc -;;
    1 ) vim -u ~/.dotfiles/.lessvimrc -R $1;;
  esac
}
