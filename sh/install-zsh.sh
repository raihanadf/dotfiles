# Install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# Install antibody 
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
antibody bundle < ~/dotfiles/.zsh_plugins

