#!/bin/bash
set -e

echo "Enter a password for root user:"
sudo passwd root

echo "Enter a password for user vscode:"
sudo passwd vscode

DEVPOD_USER="devpod-user"
if id -u vscode >/dev/null 2>&1; then
  echo "Renaming user 'vscode' to '$DEVPOD_USER'..."
  sudo usermod -l "$DEVPOD_USER" vscode
  sudo groupmod -n "$DEVPOD_USER" vscode

  echo "Moving home directory to /home/$DEVPOD_USER ..."
  sudo usermod -d "/home/$DEVPOD_USER" -m "$DEVPOD_USER"

	echo "Enter a password for user '$DEVPOD_USER:"
	sudo passwd vscode

  echo "Adding '$DEVPOD_USER' to sudo group..."
  sudo usermod -aG sudo "$DEVPOD_USER"

  echo "Changing default shell for $DEVPOD_USER to zsh..."
	sudo chsh -s "$(which zsh)" "$(whoami)"
fi

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
