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
export HISTFILE=~/.bash_history_
export LD_LIBRARY_PATH=~/lib:~/usr/lib:~/usr/lib64:$LD_LIBRARY_PATH
export LOCK_DIR="/var/lock/lockdev/"
export PATH=~/.cargo/bin:~/go/bin:~/bin/:/usr/sbin:$PATH
export PKG_CONFIG_PATH=~/lib/pkgconfig:~/usr/lib/pkgconfig:~/usr/lib64/pkgconfig:$PKG_CONFIG_PATH
export USE_CCACHE=1
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# shellcheck source=/dev/null
[[ -s /usr/share/autojump/autojump.bash ]] && . /usr/share/autojump/autojump.bash
# shellcheck source=/dev/null
[[ -s  ~/.bash_aliases ]] && . ~/.bash_aliases

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s dirspell
shopt -s histappend

for bashrc in ~/.bashrc.d/*; do
	# shellcheck source=/dev/null
	source "$bashrc"
done

for bashrc in ~/.bashrc.d.private/*; do
	# shellcheck source=/dev/null
	source "$bashrc"
done

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

export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# shellcheck source=/dev/null
[[ -s "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]] && . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
