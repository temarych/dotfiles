#!/usr/bin/env bash
set -euo pipefail

echo "Installing Homebrew bundles..."
brew bundle

echo "Setting up Alacritty terminfo..."
(
  git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
  cd /tmp/alacritty
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
)
rm -rf /tmp/alacritty

echo "Installing Oh My Zsh..."
[ -d ~/.oh-my-zsh ] || KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

echo "Installing Node.js..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 22

echo "Installing bun..."
curl -fsSL https://bun.com/install | bash

echo "Cloning zsh plugins..."
[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

echo "Installing rustup and cargo..."
curl https://sh.rustup.rs -sSf | sh -s -- -y

echo "Installing pnpm dependencies..."
pnpm add -g vscode-langservers-extracted yaml-language-server --allow-build=core-js
pnpm add -g pyright
pnpm add -g @typescript/native-preview
pnpm add -g cssmodules-language-server 
pnpm add -g @fsouza/prettierd

echo "Installing uv dependencies.."
uv tool install ty@latest
uv tool install ruff@latest

echo "Installing cargo dependencies..."
cargo install taplo-cli --locked
cargo install stylua --features luajit
cargo install tree-sitter-cli --locked

echo "Stowing dotfiles..."
stow alacritty starship fzf yazi zsh nvim tmux aerospace git -t ~

echo "Disabling font smoothing for Alacritty..."
defaults write org.alacritty AppleFontSmoothing -int 0

echo "Done! Open a new shell or run: source ~/.zshrc"
