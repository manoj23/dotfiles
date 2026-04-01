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

PROMPT_USERNAME=${USER:0:1}
HOSTNAME=$(hostname)
PROMPT_HOSTNAME=${HOSTNAME:0:3}

if [ "$USER" = "root" ]; then
  PROMPT="%F{red}%n%f%F{green}@%f%F{gray}$PROMPT_HOSTNAME%f %F{blue}%1~%f %F{green}$%f "
else
  PROMPT="%F{green}$PROMPT_USERNAME%f%F{green}@%f%F{gray}$PROMPT_HOSTNAME%f %F{blue}%1~%f %F{green}$%f "
fi

RPROMPT='[%F{yellow}%?%f]'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up mise for runtime management
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
  eval "$(mise completions zsh)"
fi
_set_kitty_tab_title() {
  local folder="${PWD##*/}"
  if [[ -n "$SSH_CONNECTION" ]]; then
    printf '\e]0;ssh:%s\a' "$folder"
  else
    kitty @ set-tab-title "$folder"
  fi
}
precmd() { _set_kitty_tab_title }
chpwd() { _set_kitty_tab_title }
