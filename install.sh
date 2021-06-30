# Initial install
sudo apt install zsh \
    git \
    zip \
    unzip 

# Install zsh 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# Install antibody 
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
antibody bundle < ~/dotfiles/.zsh_plugins

# Install Vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Hardlink dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# Install git
read -p 'Input your email: ' email
ssh-keygen -t ed25519 -C "${email}"

# Install volta
curl https://get.volta.sh | bash -s -- --skip-setup

# Install Node
volta install node@latest

# Afterthought
clear
printf '********** The installation is done **********\n'
# Output public key
printf "\nThis is your SSH key : \n"
cat ~/.ssh/id_ed25519.pub
printf "\nCopy your key to Github (CTRL + Mouse1) : https://github.com/settings/ssh/new\n"