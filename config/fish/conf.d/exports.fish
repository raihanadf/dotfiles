# volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path $VOLTA_HOME/bin

# laravel
set -gx LARAVEL_HOME "$HOME/.config/composer/vendor"
fish_add_path $LARAVEL_HOME/bin

# deno
set -gx DENO_INSTALL "$HOME/.deno"
fish_add_path $DENO_INSTALL/bin

# dart
fish_add_path /usr/lib/dart/bin

# gpg
set -gx GPG_TTY (tty)

# bun completions
test -s "$HOME/.bun/_bun"; and source "$HOME/.bun/_bun"

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# android sdk
set -gx ANDROID_HOME $HOME/.sdk_dir/Android/Sdk
set -gx ANDROID_SDK_ROOT $HOME/.sdk_dir/Android/Sdk
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/build-tools
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin

# flutter
fish_add_path $HOME/.sdk_dir/flutter/bin
set -gx CHROME_EXECUTABLE /usr/bin/zen-browser

# pub cache
fish_add_path $HOME/.pub-cache/bin

# everything-i-guess bin
fish_add_path $HOME/.local/bin

# everything-i-guess bin
fish_add_path $HOME/.bin

# sdkman
set -gx SDKMAN_DIR "$HOME/.sdkman"
test -s "$HOME/.sdkman/bin/sdkman-init.sh"; and source "$HOME/.sdkman/bin/sdkman-init.sh"

# nnn plugins
set -gx NNN_PLUG 'f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'

# spicetify
fish_add_path $HOME/.spicetify

# pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
if test -d "$PYENV_ROOT/bin"
    fish_add_path $PYENV_ROOT/bin
end
status is-interactive; and source (pyenv init -|psub)

# xcursor
# set -gx XCURSOR_PATH $RUNTIME/usr/share/icons
