if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ''

# keybindings
fish_vi_key_bindings insert
fzf_configure_bindings --directory=\ec --variables=\ev
