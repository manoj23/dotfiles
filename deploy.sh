#!/usr/bin/env bash

stow bash
sudo stow bash -t /root/
stow ckermit
stow git
stow i3
stow radare2
stow screen
stow termite
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

# installl tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.tmux.conf
fi

# install nvm
if [ ! -d ~/.nvm ]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

[ -x private/deploy.sh ] && (cd private && ./deploy.sh)
