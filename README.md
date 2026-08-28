# Dotfiles

Personal macOS setup.

## Contents

- `zsh/` — `.zshrc`, `.p10k.zsh` (oh-my-zsh + powerlevel10k)
- `aerospace/` — [AeroSpace](https://github.com/nikitabobko/AeroSpace) tiling window manager config
- `sketchybar/` — [sketchybar](https://github.com/FelixKratz/SketchyBar) status bar config, based on [TheGoldenPatrik1/sketchybar-config](https://github.com/TheGoldenPatrik1/sketchybar-config), adapted to talk to AeroSpace instead of yabai (workspace switching, active-workspace highlight, per-workspace app icons)
- `alacritty/` — terminal emulator config
- `nvim/` — Neovim config, based on [NvChad](https://github.com/NvChad/NvChad) (starter template)
- `tmux/` — tmux config

## Install

```bash
./install.sh
```

Installs oh-my-zsh + zsh plugins + tpm, then symlinks `zsh/.zshrc`, `zsh/.p10k.zsh`, `tmux/tmux.conf`, and `nvim/` into `$HOME`.

AeroSpace and sketchybar configs aren't auto-symlinked yet — copy/symlink `aerospace/` to `~/.config/aerospace` and `sketchybar/` to `~/.config/sketchybar` manually.
