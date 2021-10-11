# Created by raihan for 5.8

#  start up
eval "$(starship init zsh)"
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# history
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=2000

unsetopt beep

# compinit
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# antibody
source <(antibody init)
antibody bundle < ~/.dotfiles/dots/.zsh_plugins

# imports
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Disable the cursor style feature
ZVM_CURSOR_STYLE_ENABLED=false