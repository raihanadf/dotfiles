<div align="center">

<!-- BADGES -->
   <p></p>
   <a href="">
      <img src="https://img.shields.io/github/issues/raihanadf/dotfiles?color=181926&labelColor=0A0D0F&style=for-the-badge">
   </a>
   <a href="https://github.com/raihanadf/dotfiles/stargazers">
      <img src="https://img.shields.io/github/stars/raihanadf/dotfiles?color=181926&labelColor=0A0D0F&style=for-the-badge">
   </a>
   <a href="https://github.com/raihanadf/dotfiles/">
      <img src="https://img.shields.io/github/repo-size/raihanadf/dotfiles?color=181926&labelColor=0A0D0F&style=for-the-badge">
  </a>
</div>

![arch](config/screenshot.png)

<div align="center">

<h3><b>Welcome!</b></h3> 
This repo is a collection of my dotfiles. I mainly develop and study for Android <i>(Kotlin, any)</i>, or frontend with <i>(Javascript, PHP, any)</i>. These may impact how my editors are configured. NB: [ I use this setup for gaming too ]

</div>

<br/>
<br/>

<h2>Install</h2>

```shell script

# first setup the ssh key for github
email="<your email>"
ssh-keygen -t ed25519 -C "${email}"

# make a new directory (for me)
git clone git@github.com:17radf/dotfiles.git ~/.dotfiles

# install
cd ~/.dotfiles
./install

```

<br/>

## Setup Details

<details>  <summary>Expand</summary>

some information about my setup:

- OS: [Arch Linux](https://archlinux.org/)
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty)
- Shell: [zsh](https://www.zsh.org/)
- Prompt: [Starship](https://starship.rs/)
- WM: [dwm](https://dwm.suckless.org/)
- Login Manager: [ly](https://github.com/fairyglade/ly)
- Editor: [nvim](https://github.com/neovim/neovim)

</details>
<br/>

## <b>dwm</b> Patches

<details>  <summary>Expand</summary>

- BAR_AWESOMEBAR_PATCH
- BAR_STATUS_PATCH
- BAR_STATUSBUTTON_PATCH
- BAR_STATUS2D_PATCH
- BAR_SYSTRAY_PATCH
- BAR_UNDERLINETAGS_PATCH
- BAR_TITLE_LEFT_PAD_PATCH
- BAR_BORDER_PATCH
- BAR_CENTEREDWINDOWNAME_PATCH
- BAR_IGNORE_XFT_ERRORS_WHEN_DRAWING_TEXT_PATCH
- BAR_PADDING_VANITYGAPS_PATCH
- ATTACHBOTTOM_PATCH
- CENTER_PATCH
- COMBO_PATCH
- COOL_AUTOSTART_PATCH
- CYCLELAYOUTS_PATCH
- FOCUSONNETACTIVE_PATCH
- ONLYQUITONEMPTY_PATCH
- RESTARTSIG_PATCH
- SWITCHTAG_PATCH
- VANITYGAPS_PATCH
- ZOOMSWAP_PATCH
- TILE_LAYOUT
- MONOCLE_LAYOUT

</details>
<br/>

## Little Notes

this might break your own system, this is not one-click-and-done solution an installation. so pay attention to what you are going to do ;) <strong>-R</strong>
