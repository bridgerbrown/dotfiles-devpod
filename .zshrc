# ZSH GENERAL
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# PLUGINS
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# INITIALIZE SECRETS FILE
[ -f ~/.zsh_secrets ] || touch ~/.zsh_secrets
source ~/.zsh_secrets

# SHORTCUTS
alias v="nvim"

cfzsh() { nvim ~/.zshrc }
cfnv() { cd ~/.config/nvim && nvim; }

# PROMPT
autoload -Uz vcs_info add-zsh-hook
precmd() { vcs_info }

PROMPT='%(?.%F{green}⏺.%F{red}⏺)%f %2~ %# '
RPROMPT='⎇ ${vcs_info_msg_0_}'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true

# PATHS
export PATH="$HOME/.local/bin:$PATH"

