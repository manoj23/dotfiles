#!/usr/bin/env bash

if ! command -v nix-channel; then
	echo "Please install nix, Bye!"
	exit 1
fi

if ! command -v home-manager; then
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install
fi

nix-shell -p stow --command "stow nix"

home-manager switch

if ! command -v stow; then
	echo "Please install stow, Bye!"
	exit 1
fi

if ! command -v curl; then
	echo "Please install curl, Bye!"
	exit 1
fi

if ! command -v git; then
	echo "Please install git, Bye!"
	exit 1
fi

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

if command -v xrdb; then
	xrdb ~/.Xresources
fi

# install dein
if [ ! -d ~/.config/nvim/bundles ]; then
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > vim/installer.sh
	mkdir -p ~/.config/nvim/bundles/
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
