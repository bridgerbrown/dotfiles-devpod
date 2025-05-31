#!/bin/bash

set -e

sudo apt-get update -y
sudo apt-get upgrade -y

# Homebrew 
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    echo "Homebrew is already installed"
else
    echo "Installing Homebrew"
    mkdir -p /home/linuxbrew
    chown -R $(whoami) /home/linuxbrew 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
if ! echo "$PATH" | grep -q "/home/linuxbrew/.linuxbrew/bin"; then
    echo "WARNING: /home/linuxbrew/.linuxbrew/bin not in PATH. May cause issues."
fi

if ! brew update; then
    echo "Homebrew is having issues updating"
fi

# Dotfiles setup
git submodule init
git submodule update

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"
ln -sf "/home/dotfiles/config.nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "/home/dotfiles/zsh-config/.zshrc" "$HOME"/.zshrc

source /home/ubuntu/.zshrc
source /home/ubuntu/.config/nvim/init.lua

# Brew packages
brew install fd ripgrep pyenv npm awscli

echo "Packages are now installed with configuration complete."
