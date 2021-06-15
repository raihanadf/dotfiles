# Install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# Install antibody 
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# Hardlink dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh