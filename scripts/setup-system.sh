#!/bin/bash
set -e

echo "Enter a password for root user:"
sudo passwd root

echo "Enter a password for user vscode:"
sudo passwd vscode

# setup zsh shell
echo "Setting up zshrc..."
zsh -c 'source "$HOME/dotfiles/.zshrc"'

echo -e "\n\n"
echo -e "\033[1;32m╭───────────────────────────────╮\033[0m"
echo -e "\033[1;32m│                               │\033[0m"
echo -e "\033[1;32m│    System setup complete!     │\033[0m"
echo -e "\033[1;32m│                               │\033[0m"
echo -e "\033[1;32m╰───────────────────────────────╯\033[0m"
echo -e "\n\n"
