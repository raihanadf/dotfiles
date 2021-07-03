# Initial install
sudo apt install zsh \
    git \
    zip \
    unzip \
    gcc \
    make \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libsqlite3-dev

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

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Afterthought
clear
printf '========== The installation is done ==========\n'
printf "\n - Please quit the terminal by typing 'exit' after the installation"
printf "\n - To install ruby: run the ruby.sh"
# Output public key
printf "\n - This is your SSH key: \n\n"
cat ~/.ssh/id_ed25519.pub
printf "\n - Copy your key to Github (CTRL + Mouse1): https://github.com/settings/ssh/new\n"