#!/usr/bin/env bash

stow bash
sudo stow bash -t /root/
stow ckermit
stow git
stow i3
stow screen
stow tmux
stow Xresources

xrdb ~/.Xresources

# install dein
if [ ! -d ~/.config/nvim/bundles ]; then
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > vim/installer.sh
	mkdir ~/.config/nvim/bundles/
	sh ./vim/installer.sh ~/.config/nvim/bundles
	rm vim/installer.sh
fi
