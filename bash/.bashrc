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

if [[ $(whoami) == "root" ]]; then
	PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
else
	PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
fi

if command -v ee > /dev/null 2>&1; then
	_completion_loader dd
	complete -F _dd -o nospace ee
fi

# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

update_title()
{
	echo -en "\e]0;$PWD\a"
}
trap update_title DEBUG
