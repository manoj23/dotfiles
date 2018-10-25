#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -n "$DISPLAY" ] ; then
	xset r rate 350 50
fi
