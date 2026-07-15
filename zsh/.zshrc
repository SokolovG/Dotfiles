export ZSH_COMPDUMP="$HOME/.cache/.zcompdump"
mkdir -p "$HOME/.cache"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

alias git='LANG=en_US.UTF-8 git'
alias ll="ls -lah"
alias gs="git status"
alias gp="git push"
alias addalias='nvim ~/.zshrc'
export PATH="$HOME/bin:/usr/local/bin:$PATH"
command -v eza >/dev/null && alias ls="eza --icons=always"

HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000

export VIRTUAL_ENV_DISABLE_PROMPT=1

autoload -U compinit
compinit

export EDITOR="nvim"

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# p10k theme
[ -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ] && source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ] && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
