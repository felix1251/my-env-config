#!/usr/bin/env bash

DOTFILES="$HOME/my-config"

link() {
    src=$1
    dest=$2

    # If already a symlink to the right file, skip
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "Already linked: $dest -> $src"
        return
    fi

    # If destination exists and isn’t a symlink, back it up
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "Backing up existing $dest to $dest.backup"
        mv "$dest" "$dest.backup"
    fi

    # Ensure parent directory exists
    mkdir -p "$(dirname "$dest")"

    # Create the symlink
    ln -sfn "$src" "$dest"
    echo "Linked $dest -> $src"
}

# Neovim
link "$DOTFILES/nvim" "$HOME/.config/nvim"

# Tmux
link "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

# Alacritty
link "$DOTFILES/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
