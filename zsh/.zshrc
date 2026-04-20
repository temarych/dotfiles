eval "$(starship init zsh)"
source <(fzf --zsh)

if [ -f ~/.config/fzf/setup.sh ]; then
  source ~/.config/fzf/setup.sh
fi

export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
