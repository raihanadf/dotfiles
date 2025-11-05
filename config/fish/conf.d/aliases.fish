# ===== Variables =====
set -gx nginxdir /usr/local/var/www   # default macOS nginx dir (brew)
set -gx nvimdir $HOME/.config/nvim

# ===== Simple aliases =====
alias pls='sudo (history | tail -n1)'
alias open="open"  # macOS uses `open`
alias c="clear"
alias q="exit"
alias cq="clear && exit"
alias nnn='nnn -de'
alias sl='sl -a -w -l'
alias sizedir="du -h -d 1"
alias ls='ls -G'  # macOS uses -G for color
alias la='ls -laG'
alias l='ls -d .* -G'

# ===== Edit configs =====
alias zshalias="nvim $HOME/.zsh_aliases"
alias zshplugin="nvim $HOME/.dotfiles/dots/zsh_plugins"
alias zshconfig="nvim $HOME/.zshrc"
alias vimconfig="nvim $HOME/.vimrc"
alias nvimconfig="nvim $HOME/.config/nvim/init.lua"

# ===== Replace with better app =====
alias vi="nvim"
alias py="python3"
# alias cat="batcat"

# ===== Directories =====
alias nginxdir="cd $nginxdir"
alias nvimdir="cd $nvimdir"

# ===== Android mount =====
alias androidmount="aft-mtp-mount $HOME/MountHere"
alias androidumount="umount $HOME/MountHere"

# ===== Network =====
# macOS uses `networksetup` or `airport` instead of nmtui
alias wifi="networksetup -listallhardwareports"

# ===== Kill all session =====
alias killmyself="pkill -KILL -u (whoami)"

# ===== Record =====
# gpu-screen-recorder isn't available on macOS — replace with QuickTime or ffmpeg
alias record='ffmpeg -f avfoundation -framerate 60 -i "1" $HOME/Videos/now-recorded.mp4'

# ===== Functions =====
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

# ===== Git zip =====
alias gitzip="git archive HEAD -o (basename $PWD).zip"

# ===== Archived =====
alias sail='[ -f sail ]; and sh sail; or sh vendor/bin/sail'
alias emulator='$ANDROID_HOME/emulator/emulator'
# macOS uses `ipconfig getifaddr en0` instead of ip/awk combo
alias myip="ipconfig getifaddr en0"

# ===== SSH with kitty =====
if test "$TERM" = "xterm-kitty"
    alias ssh="kitty +kitten ssh"
end

# ===== Abbreviations =====
abbr --add !! 'sudo $history[1]'
