pathdirs=(
  /usr/local/sbin
  /usr/local/bin
  /Users/utaal/bin
  /usr/local/share/python
  /Users/utaal/Apps/bin
)
pathdirs=($^pathdirs(N))

for dir in $pathdirs; do export PATH=$dir:$PATH; done

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

# Initializes Oh My Zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ($ZSH/lib/*.zsh) source $config_file

# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
# if [[ -z "$ZSH_CUSTOM" ]]; then
#     ZSH_CUSTOM="$ZSH/custom"
# fi


is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || test -f $base_dir/plugins/$name/_$name
}
# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
#  if is_plugin $ZSH_CUSTOM $plugin; then
#    fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
  if is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  fi
done

# Load and run compinit
autoload -U compinit
compinit -i


# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
#  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
#    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# Load all of your custom configurations from custom/
# for config_file ($ZSH_CUSTOM/*.zsh(N)) source $config_file

# Load the theme
source $ZSH/powerline.zsh-theme
