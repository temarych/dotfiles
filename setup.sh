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

echo "Cloning zsh plugins..."
[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

echo "Installing rustup and cargo..."
curl https://sh.rustup.rs -sSf | sh -- -y

echo "Installing pnpm dependencies..."
pnpm add -g vscode-langservers-extracted yaml-language-server --allow-build=core-js

echo "Installing cargo dependencies..."
cargo install taplo-cli --locked
cargo install stylua --features luajit

echo "Stowing dotfiles..."
stow alacritty starship zsh nvim tmux aerospace -t ~

echo "Done! Open a new shell or run: source ~/.zshrc"
