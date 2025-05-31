#!/bin/bash

set -e

sudo apt-get update -y
sudo apt-get upgrade -y

# Homebrew 

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

brew update || echo "Homebrew update failed"

# Dotfiles setup
cd "$HOME/dotfiles" || exit 1

# Initialize submodules only if they aren't already present
if [ -d ".git" ] && grep -q "submodule" .gitmodules 2>/dev/null; then
  git submodule update --init --recursive
fi

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"
ln -sf "/home/dotfiles/config.nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "/home/dotfiles/zsh-config/.zshrc" "$HOME"/.zshrc

# Brew packages
brew install fd ripgrep pyenv npm awscli neovim

echo "SETUP COMPLETE!"
