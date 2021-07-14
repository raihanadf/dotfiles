# start up
cd
bindkey -v

# compinit
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# starship
eval "$(starship init zsh)"

# antibody
source <(antibody init)
antibody bundle < ~/.dotfiles/.zsh_plugins

# imports
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
