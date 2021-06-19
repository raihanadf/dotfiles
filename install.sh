########## WARNING ##########
### THIS IS EXPERIMENTAL ###
############################

# Initial install
echo '\nInstalling dependencies...\n'
sleep 2
sudo apt install zsh \
    git \
    zip \
    unzip 

# Install zsh 
echo '\nPerforming Zsh install...\n'
sleep 2
./sh/install-zsh.sh

# Install git
echo '\nPerforming Git install...\n'
sleep 2
./sh/install-git.sh

# Install volta
echo '\nPerforming Volta install...\n'
sleep 2
./sh/install-volta.sh
sleep 2

# Afterthought
clear
echo '***** The installation is done *****\n'
# Output public key
echo "\nThis is your SSH key : \n"
cat ~/.ssh/id_ed25519.pub
echo "\nCopy your key to Github (CTRL + M1) : https://github.com/settings/ssh/new\n"

# I'm just adding the artificial seconds
# just to see what action was performed
# in what seconds, might remove it if it
# ain't needed anymore lol