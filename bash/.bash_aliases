alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ag='rg'
alias rg='rg -g \!tags'
alias ll='ls'
alias f='sharkdp_fd'
alias hexedit='hexedit --color'
alias grep='grep --color=auto'
alias rgrep='grep --color -rn'
alias diff='colordiff'
alias vim='nvim'
alias vi='vim'
alias v='vim'
alias m='make -j8'
alias n='ninja'
alias g='git'
alias gitk='gitk -n100'
alias s='sync'
alias d='dtrx'
alias ckermit='ckermit -c'
alias kermit0='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyS0'
alias kermit1='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyUSB0'
alias kermit2='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyUSB1'
alias kermit3='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyUSB2'
alias i3lock='i3lock --color=000000'
alias sudo='sudo '

if [[ "$OSTYPE" == "darwin"* ]]; then
alias ls='ls -G'
else
alias rm='rm --one-file-system'
alias ls='ls --color=auto'
fi
