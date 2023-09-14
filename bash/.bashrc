#
# ~/.bashrc
#

[ -f ~/.bash_env ] && source ~/.bash_env

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind 'set show-all-if-ambiguous on'

# shellcheck source=/dev/null
[[ -s /usr/share/autojump/autojump.bash ]] && . /usr/share/autojump/autojump.bash

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s dirspell
shopt -s histappend

PROMPT_USERNAME=${USER:0:1}
PROMPT_HOSTNAME=${HOSTNAME:0:3}

if [[ $(whoami) == "root" ]]; then
	PS1='\[\e[0;31m\]\u\[\e[0;38;5;22m\]@\[\e[0;38;5;238m\]$PROMPT_HOSTNAME \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
else
	PS1='\[\e[0;38;5;22m\]$PROMPT_USERNAME\[\e[0;38;5;22m\]@\[\e[0;38;5;238m\]$PROMPT_HOSTNAME \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
fi

if command -v ee > /dev/null 2>&1; then
	_completion_loader dd
	complete -F _dd -o nospace ee
fi

# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# shellcheck source=/dev/null
[ -r "/etc/bashrc_$TERM_PROGRAM" ] && source "/etc/bashrc_$TERM_PROGRAM"

update_title()
{
	echo -en "\e]0;$PWD\a"
}
trap update_title DEBUG
