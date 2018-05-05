#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind 'set show-all-if-ambiguous on'

export CHERRY_PICK_DIR=
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export HISTCONTROL=erasedups
export HISTFILESIZE=
export HISTSIZE=
export LD_LIBRARY_PATH=~/lib:~/usr/lib:~/usr/lib64:$LD_LIBRARY_PATH
export LOCK_DIR="/var/lock/lockdev/"
export PATH=~/bin/:$PATH
export PKG_CONFIG_PATH=~/lib/pkgconfig:~/usr/lib/pkgconfig:~/usr/lib64/pkgconfig:$PKG_CONFIG_PATH
export USE_CCACHE=1

[[ -s /usr/share/autojump/autojump.bash ]] && . /usr/share/autojump/autojump.bash
[[ -s  ~/.bash_aliases ]] && . ~/.bash_aliases

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s histappend

for bashrc in ~/.bashrc.d/*; do
	# shellcheck source=/dev/null
	source "$bashrc"
done

if [[ $(whoami) == "root" ]]; then
	PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
else
	PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
fi

_completion_loader dd
complete -F _dd -o nospace ee
