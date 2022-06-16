source ~/.bash_env

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '~.zshrc'

autoload -Uz compinit
compinit

fpath=(~/.zsh "${fpath[@]}")

if [ "$USER" = "root" ]; then
  PROMPT='%F{red}%n%f %F{blue}%1~%f %F{green}$%f '
else
  PROMPT='%F{green}%n%f %F{blue}%1~%f %F{green}$%f '
fi

RPROMPT='[%F{yellow}%?%f]'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
