#!/bin/bash
set -e

echo "Enter a password for root user:"
sudo passwd root

echo "Enter a password for devpod-user:"
sudo passwd devpod-user 

# setup zsh shell
echo "Setting up zshrc and switching to zsh..."
sudo chsh -s "$(which zsh)" "$(whoami)"
zsh -c 'source "$HOME/dotfiles/.zshrc"'
