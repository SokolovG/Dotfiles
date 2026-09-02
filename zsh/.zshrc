export ZSH_COMPDUMP="$HOME/.cache/.zcompdump"
mkdir -p "$HOME/.cache"

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  web-search
  copyfile
  z
  history
  git
  copypath
  copyfile
  docker
  colored-man-pages
  extract
  sudo
)

source $ZSH/oh-my-zsh.sh

# --- History ---
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# --- Environment ---
export EDITOR="nvim"
export TERM_PROGRAM="alacritty"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export LMSTUDIO_API_KEY="lm-studio"

# --- PATH ---
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# --- Tool integrations ---
. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.npm-global/bin:$PATH"

# --- Aliases ---
alias git='LANG=en_US.UTF-8 git'
alias ll="ls -lah"
alias ls="eza --icons=always"
alias gs="git status"
alias gp="git push"
alias addalias='nvim ~/.zshrc'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
