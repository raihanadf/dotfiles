My Setup & Dotfiles
===================

- Host: Windows 10
  - Ubuntu via WSL 2 
- Terminal: Windows Terminal
- Shell: zsh
  - git
- Node.js ([Volta](https://volta.sh))
  - node
  - npm

WSL Setup
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

ZSH Setup
```shell script

# Make a new directory
git clone git@github.com:17radf/dotfiles.git ~/dotfiles/

# antibody ## WIP LATER
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# Hardlink dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

```

Git Setup
```shell script

# Generate new SSH key
email="12584890+17radf@users.noreply.github.com"
ssh-keygen -t ed25519 -C "${email}}"

# Add key to id_rsa
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# Output public key
cat ~/.ssh/id_rsa.pub

```

- Copy the key [here](https://github.com/settings/ssh/new)