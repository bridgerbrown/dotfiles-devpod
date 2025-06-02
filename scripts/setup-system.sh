#!/bin/bash
set -e

# setup user passwords
echo "Enter a password for root user:"
sudo passwd root

echo "Enter a password for user vscode:"
sudo passwd vscode

# .bashrc
# echo "Setting up '.bashrc'..."
# if [ -f ~/.bashrc ]; then
#   source ~/.bashrc
# fi

echo -e "\n\n"
echo -e "\033[1;32m╭───────────────────────────────╮\033[0m"
echo -e "\033[1;32m│                               │\033[0m"
echo -e "\033[1;32m│    System setup complete!     │\033[0m"
echo -e "\033[1;32m│                               │\033[0m"
echo -e "\033[1;32m╰───────────────────────────────╯\033[0m"
echo -e "\n\n"
