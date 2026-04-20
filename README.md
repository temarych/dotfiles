# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Stack

| Tool | Purpose |
|------|---------|
| [Neovim](https://neovim.io) | Editor |
| [Alacritty](https://alacritty.org) | Terminal emulator |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [Zsh](https://zsh.org) + [Oh My Zsh](https://ohmyz.sh) | Shell |
| [Starship](https://starship.rs) | Prompt |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [yazi](https://github.com/sxyazi/yazi) | File manager |
| [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling window manager |
| [TokyoNight](https://github.com/folke/tokyonight.nvim) | Theme |

## Requirements

- macOS
- [Homebrew](https://brew.sh)

## Installation

```bash
git clone https://github.com/temarych/dotfiles
source dotfiles/setup.sh
```

The setup script installs dependencies and symlinks all configs into home directory.
