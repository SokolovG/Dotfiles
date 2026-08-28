export ZSH_COMPDUMP="$HOME/.cache/.zcompdump"
mkdir -p "$HOME/.cache"

# --- Powerlevel10k instant prompt ---
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
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

# --- Prompt theme ---
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
