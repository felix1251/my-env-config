#!/usr/bin/env bash

DOTFILES="$HOME/my-config"
NVIM_VERSION="0.11.3"
TMUX_TPM_DIR="$HOME/.tmux/plugins/tpm"

install_neovim() {
    if command -v nvim >/dev/null 2>&1; then
        echo "Neovim already installed: $(nvim --version | head -n1)"
        return
    fi

    echo "Installing Neovim version $NVIM_VERSION..."

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        curl -LO "https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-macos.tar.gz"
        tar xzf "nvim-macos.tar.gz"
        sudo mv nvim-osx64/bin/nvim /usr/local/bin/nvim
    elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
        # Ubuntu/Debian
        curl -LO "https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-linux64.tar.gz"
        tar xzf "nvim-linux64.tar.gz"
        sudo mv nvim-linux64/bin/nvim /usr/local/bin/nvim
    else
        echo "Unsupported OS. Please install Neovim $NVIM_VERSION manually."
        exit 1
    fi

    if command -v nvim >/dev/null 2>&1; then
        echo "Neovim $NVIM_VERSION installed successfully: $(nvim --version | head -n1)"
    else
        echo "Neovim installation failed!"
        exit 1
    fi
}

install_neovim

install_ripgrep() {
    if command -v rg >/dev/null 2>&1; then
        echo "Ripgrep is already installed: $(rg --version | head -n1)"
        return
    fi

    echo "Ripgrep is NOT installed. Installing..."

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if ! command -v brew >/dev/null 2>&1; then
            echo "Homebrew not found. Please install Homebrew first: https://brew.sh/"
            exit 1
        fi
        brew install ripgrep
    elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
        # Ubuntu/Debian
        sudo apt update
        sudo apt install -y ripgrep
    else
        echo "Unsupported OS. Please install ripgrep manually."
        exit 1
    fi

    # Verify installation
    if command -v rg >/dev/null 2>&1; then
        echo "Ripgrep installed successfully: $(rg --version | head -n1)"
    else
        echo "Ripgrep installation failed!"
        exit 1
    fi
}

install_ripgrep

clone_and_install_tmp() {
    # Replace if exists
    if [ -d "$TMUX_TPM_DIR" ]; then
        echo "Removing existing TPM at $TMUX_TPM_DIR"
        rm -rf "$TMUX_TPM_DIR"
    fi

    echo "Cloning TPM..."
    git clone https://github.com/tmux-plugins/tpm "$TMUX_TPM_DIR"

    "$TMUX_TPM_DIR/bin/install_plugins"
} 

clone_and_install_tmp

# Symlink
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
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Alacritty
link "$DOTFILES/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
