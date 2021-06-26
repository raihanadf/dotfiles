# start up
cd
export ZSH="/home/raihan/.oh-my-zsh"
autoload -Uz compinit && compinit
source <(antibody init)
antibody bundle < ~/dotfiles/.zsh_plugins

# imports
source $ZSH/oh-my-zsh.sh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.zsh_plugins.zsh ] && source ~/.zsh_plugins.zsh

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
