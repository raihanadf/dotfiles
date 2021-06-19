# Install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# Install antibody 
echo '\nInstalling Antibody for Zsh...\n'
sleep 1
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
antibody bundle < ~/dotfiles/.zsh_plugins

# Hardlink dotfiles
echo '\nHardlinking the dotfiles...'
sleep 1
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
echo '\nHardlinking done'
sleep 1