# ~/.config/fish/conf.d/aliases.fish

# variables
set -gx nginxdir /usr/share/nginx/html
set -gx nvimdir ~/.config/nvim

# simple aliases
alias pls='sudo (history | tail -n1)'
alias open="xdg-open"
alias c="clear"
alias q="exit"
alias cq="clear && exit"
alias nnn='nnn -de'
alias sl='sl -a -w -l'
alias sizedir="du -h --max-depth=1"
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias l='ls -d .* --color=auto'

# edit configs
alias zshalias="nvim ~/.zsh_aliases"
alias zshplugin="nvim ~/.dotfiles/dots/zsh_plugins"
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"

# replace with better app
alias vi="nvim"
alias isw="sudo isw"
alias py="python"
# alias cat="batcat"

# directories
alias nginxdir="cd /usr/share/nginx/html"
alias nvimdir="cd ~/.config/nvim"

# android mount
alias androidmount="aft-mtp-mount $HOME/MountHere"
alias androidumount="umount $HOME/MountHere"

# network
alias wifi='nmtui'

# kill all session
alias killmyself="pkill -KILL -u $USER"

# record
alias record='gpu-screen-recorder -w screen -c mp4 -f 60 -a (pactl get-default-sink).monitor -q high -o ~/Videos/now-recorded.mp4'

# functions
function mkcd
    mkdir -p -- $argv[1]; and cd $argv[1]
end

function batcat
    if type -q bat
        bat $argv
    else
        cat $argv
    end
end

# git zip
alias gitzip="git archive HEAD -o (basename $PWD).zip"

# archived
alias sail='[ -f sail ]; and sh sail; or sh vendor/bin/sail'
alias emulator='$ANDROID_HOME/emulator/emulator'
alias myip="ip -o -4 addr list wlo1 | awk '{print \$4}' | cut -d/ -f1"

# ssh with kitty
if test "$TERM" = "xterm-kitty"
    alias ssh="kitty +kitten ssh"
end

abbr --add !! 'sudo $history[1]'
