alias v="nvim"

cfbash() {
  nvim ~/.bashrc
}
cfnv() {
  cd ~/.config/nvim && nvim
}

# secrets file
[ -f ~/.bash_secrets ] || touch ~/.bash_secrets
source ~/.bash_secrets 2>/dev/null || true

# paths
export PATH="$HOME/.local/bin:$PATH"

parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# prompt
GREEN="\[\e[32m\]"
RED="\[\e[31m\]"
RESET="\[\e[0m\]"
YELLOW="\[\e[33m\]"

PS1='\[$(if [ $? = 0 ]; then echo "'"$GREEN"⏺"'" ; else echo "'"$RED"⏺"'" ; fi)\] \w '

PROMPT_COMMAND='
  BRANCH=$(parse_git_branch)
  if [ -n "$BRANCH" ]; then
    PS1+="⎇ ${YELLOW}${BRANCH}${RESET} "
  fi
'
