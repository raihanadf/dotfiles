alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias c="clear"
alias q="exit"
alias mdb="sudo service mongodb"
alias neofetch="neofetch --ascii_distro windows"

# moving directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias towin="cd /mnt/c/Users/raihan"

# listing
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'


mkcd () { mkdir -p -- "$1" && cd -P -- "$1" }
