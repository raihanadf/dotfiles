########## WARNING ##########
### THIS IS EXPERIMENTAL ###
############################
### I DONT KNOW WHY IT  ####
### INSTALLING ON /ROOT ###
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
sudo ./sh/install-zsh.sh

# Install git
echo '\nPerforming Git install...\n'
sleep 2
sudo ./sh/install-git.sh

Install volta
echo '\nPerforming Volta install...\n'
sleep 2
sudo ./sh/install-volta.sh

# Afterthought
sleep 3
sudo ./sh/afterthought.sh

# I'm just adding the artificial seconds
# just to see what action was performed
# in what seconds, might remove it if it
# ain't needed anymore lol