My Setup & Dotfiles
===================

- Windows 10 w/ Ubuntu WSL
- Windows Terminal
- zsh
- [Volta](https://volta.sh)

WSL Setup
---------
```powershell
# Open PowerShell ( Administrator )

# Enable WSL and some features
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Download and install the Linux kernel update package
$wslUpdateInstallerUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$downloadFolderPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$wslUpdateInstallerFilePath = "$downloadFolderPath/wsl_update_x64.msi"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($wslUpdateInstallerUrl, $wslUpdateInstallerFilePath)
Start-Process -Filepath "$wslUpdateInstallerFilePath"

# Set WSL default version to 2
wsl --set-default-version 2
```

Automatic Setup Install 
--------------------------------------
```shell script

# Make a new directory
git clone git@github.com:17radf/dotfiles.git ~/dotfiles/

# You can install automatically by running ./install.sh
# or manually by following instruction below this guide

# Automatic install 
cd ~/dotfiles
./install.sh

# Manual Install (Check below)

```

Manual Setup Install
--------------------
```shell script


########### Zsh Setup ###########

# Install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install antibody 
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
antibody bundle < ~/dotfiles/.zsh_plugins

# Hardlink dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.vimrc ~/.vimrc

########### Git Setup ###########

# Generate new SSH key
email="12584890+17radf@users.noreply.github.com"
ssh-keygen -t ed25519 -C "${email}"

# Output public key
cat ~/.ssh/id_ed25519.pub

# Copy the key here: https://github.com/settings/ssh/new

########### Volta Setup ###########

# Install Volta
curl https://get.volta.sh | bash -s -- --skip-setup

# Install Node
volta install node@latest

```
