KEYTIMEOUT=1

export TERM=alacritty
export EDITOR=nvim

eval "$(starship init zsh)"
source <(fzf --zsh)

if [ -f ~/.config/fzf/setup.sh ]; then
  source ~/.config/fzf/setup.sh
fi

export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

bindkey -v

bindkey -M viins '^P' history-beginning-search-backward
bindkey -M viins '^N' history-beginning-search-forward
bindkey -M vicmd '^P' history-beginning-search-backward
bindkey -M vicmd '^N' history-beginning-search-forward

export PNPM_HOME="/Users/envdev/Library/pnpm"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

. "$HOME/.cargo/env"
