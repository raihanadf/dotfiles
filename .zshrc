# start up
cd
export ZSH="/home/raihan/.oh-my-zsh"

# plugins or theme

ZSH_THEME="half-life"
plugins=(git nvm)

# imports
source $ZSH/oh-my-zsh.sh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
