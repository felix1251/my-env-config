#!/usr/bin/env bash

DOTFILES="$HOME/my-env-config"

symlink "$DOTFILES/nvim" "$HOME/.config/nvim"
symlink "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
symlink "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
