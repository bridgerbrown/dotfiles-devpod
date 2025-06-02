#!/bin/bash
set -e

echo "Enter a password for root user:"
sudo passwd root

echo "Enter a password for user vscode:"
sudo passwd vscode

# setup user name and pw
DEVPOD_USER="devpod-user"
if id -u vscode >/dev/null 2>&1; then
  echo "Renaming user 'vscode' to '$DEVPOD_USER'..."
  sudo usermod -l "$DEVPOD_USER" vscode
  sudo groupmod -n "$DEVPOD_USER" vscode
fi

# setup zsh shell
echo "Setting up zshrc and switching to zsh..."
sudo chsh -s "$(which zsh)" "$(whoami)"
zsh -c 'source "$HOME/dotfiles/.zshrc"'
