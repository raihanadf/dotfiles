install 
=======

```shell script

# first setup the ssh key for github
email="urgitmail@copedept.com" 
ssh-keygen -t ed25519 -C "${email}"

# make a new directory
git clone git@github.com:17radf/wyvern.git ~/.dotfiles

# install 
cd ~/.dotfiles
./install

```

setup details
=============

- arch linux
- kitty w/ zsh
- i3-gaps, polybar, rofi, etc
- vscode, nvim 

![arch](https://github.com/17radf/dotfiles/blob/master/config/screenshot.png)
