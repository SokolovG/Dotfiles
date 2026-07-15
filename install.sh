#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# oh-my-zsh
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
clone_if_missing() { [ -d "$2" ] || git clone --depth=1 "$1" "$2"; }

clone_if_missing https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_if_missing https://github.com/agkozak/zsh-z "$ZSH_CUSTOM/plugins/zsh-z"

# tmux + tpm
clone_if_missing https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# symlinks
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
mkdir -p "$HOME/.config/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.config/nvim"
ln -sf "$DOTFILES"/nvim/* "$HOME/.config/nvim/" 2>/dev/null || true

echo "done. install packages: zsh eza bat ripgrep tmux fzf, then chsh -s \$(which zsh)"
