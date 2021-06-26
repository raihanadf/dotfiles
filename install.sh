# Initial install
sudo apt install zsh \
    git \
    zip \
    unzip 

# Install zsh 
./sh/install-zsh.sh

# Hardlink dotfiles
./sh/install-dotfiles.sh

# Install git
./sh/install-git.sh

# Install volta
./sh/install-volta.sh

# Afterthought
clear
echo '********** The installation is done **********\n'
# Output public key
echo "\nThis is your SSH key : \n"
cat ~/.ssh/id_ed25519.pub
echo "\nCopy your key to Github (CTRL + Mouse1) : https://github.com/settings/ssh/new\n"