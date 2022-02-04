# Install

```shell script

# first setup the ssh key for github
email="urgitmail@copedept.com"
ssh-keygen -t ed25519 -C "${email}"

# make a new directory
git clone git@github.com:17radf/dotfiles.git ~/.dotfiles

# install
cd ~/.dotfiles
./install

```

# Setup Details

- arch linux
- kitty w/ zsh
- i3-gaps, polybar, rofi, etc
- vscode, nvim

![arch0](/config/screenshot.png)
![arch1](/config/screenshot1.png)
