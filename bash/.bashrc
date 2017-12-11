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

kermit()
{
	if [ $# == 1 ]; then
		ckermit -c -y .kermrc -l /dev/tty$1
	fi
}

copy_sd()
{
	if [ $# != 2 ] || [ ! -b /dev/$1 ] || [ ! -f $2 ]; then
		echo "copy_sd sd{X} /path/to/file"

		if [ $# == 2 ]; then
			if [ ! -b /dev/$1 ]; then
				echo "copy_sd: Error: /dev/$1 is not a block device"
			fi
			if [ ! -f $2 ]; then
				echo "copy_sd: Error: $2 is not a file"
			fi
		fi
	else
		pmount /dev/$1
		sudo cp $2 /media/$1/
		sleep 0.1
		pumount $1
		sync
		sync
	fi
}

read_dtb()
{
	if [ -f $1 ]; then
		dtc -I dtb -O dts $1 | less
	else
		echo "File \"$1\" does no exist"
	fi
}

cherry_pick()
{
	git --git-dir=$CHERRY_PICK_DIR/.git format-patch -k -1 --stdout $1 | git am -3 -k;
}

android_flash_kernel()
{
	if [ -b /dev/$1 ] && [ -f $2 ]; then
		sudo abootimg -u /dev/$1 -k $2;
	fi
}

android_flash_dtb()
{
	if [ -b /dev/$1 ] && [ -f $2 ]; then
		sudo abootimg -u /dev/$1 -s arch/arm/boot/dts/$2;
	fi
}

android_make_ramdisk()
{
	find $1 | cpio -o -H newc | gzip > $2.cpio.gz
}

hexstring_to_binary()
{
	if [ ! -z $1 ]; then
		# http://stackoverflow.com/a/7681385
		echo -n $1 | sed 's/\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	fi
}

if [[ $(whoami) == "root" ]]; then
	PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
else
	PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
fi

_completion_loader dd
complete -F _dd -o nospace ee
