#!/usr/bin/env bash

NVIM_VERSION="0.11.3"
ALACRITTY_VERSION="0.15.1"
DOTFILES="$HOME/my-config"
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
        sudo rm -rf nvim-osx64
    elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
        # Ubuntu/Debian
        curl -LO "https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-linux64.tar.gz"
        tar xzf "nvim-linux64.tar.gz"
        sudo mv nvim-linux64/bin/nvim /usr/local/bin/nvim
        sudo rm -rf nvim-linux64
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

install_alacritty() {
    if command -v alacritty >/dev/null 2>&1; then
        echo "Alacritty is already installed: $(alacritty --version)"
        return
    fi

    echo "Installing Alacritty version $ALACRITTY_VERSION in current directory..."

    if [[ "$OSTYPE" == "darwin"* ]]; then
        TAR_FILE="Alacritty-v$ALACRITTY_VERSION.zip"
        curl -LO "https://github.com/alacritty/alacritty/releases/download/v$ALACRITTY_VERSION/$TAR_FILE"
        unzip "$TAR_FILE" -d alacritty-$ALACRITTY_VERSION
        sudo mv "alacritty-$ALACRITTY_VERSION/Alacritty.app/Contents/MacOS/alacritty" /usr/local/bin/alacritty
        sudo rm -rf alacritty-$ALACRITTY_VERSION
    elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
        TAR_FILE="Alacritty-v$ALACRITTY_VERSION.tar.gz"
        curl -LO "https://github.com/alacritty/alacritty/releases/download/v$ALACRITTY_VERSION/$TAR_FILE"
        tar -xzf "$TAR_FILE"
        sudo mv alacritty /usr/local/bin/alacritty
        sudo rm -rf alacritty
    else
        echo "Unsupported OS. Please install Alacritty $ALACRITTY_VERSION manually."
        exit 1
    fi

    echo "Alacritty $VERSION installed successfully: $(alacritty --version)"
}

install_tmux() {
    if command -v tmux >/dev/null 2>&1; then
        echo "tmux is already installed: $(tmux -V)"
        return
    fi

    echo "Installing tmux..."

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if ! command -v brew >/dev/null 2>&1; then
            echo "Homebrew not found. Please install Homebrew first: https://brew.sh/"
            exit 1
        fi
        brew install tmux
    elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
        # Ubuntu/Debian
        sudo apt update
        sudo apt install -y tmux
    else
        echo "Unsupported OS. Please install tmux manually."
        exit 1
    fi

    # Verify installation
    if command -v tmux >/dev/null 2>&1; then
        echo "tmux installed successfully: $(tmux -V)"
    else
        echo "tmux installation failed!"
        exit 1
    fi
}

install_tmux_tmp() {
    # Replace if exists
    if [ -d "$TMUX_TPM_DIR" ]; then
        echo "Removing existing TPM at $TMUX_TPM_DIR"
        rm -rf "$TMUX_TPM_DIR"
    fi

    echo "Cloning TPM..."
    git clone https://github.com/tmux-plugins/tpm "$TMUX_TPM_DIR"

    "$TMUX_TPM_DIR/bin/install_plugins"
} 

symlink() {
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

install_neovim
install_ripgrep
install_alacritty
install_tmux
install_tmux_tmp

symlink "$DOTFILES/nvim" "$HOME/.config/nvim"
symlink "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
symlink "$DOTFILES/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
