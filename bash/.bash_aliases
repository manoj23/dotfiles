alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ag='rg'
alias cat='bat --style=changes,header-filename,snip'
alias rg='rg --color=always -g \!tags'
alias less='LESSCHARSET=CP1251 less -R'
alias l='less'
alias ls='eza'
alias ll='ls'
alias f='sharkdp_fd'
alias hexedit='hexedit --color'
alias grep='grep --color=auto'
alias rgrep='grep --color -rn'
alias rsync='rsync -avh --progress --exclude=".DS_Store"'
alias diff='colordiff'
alias vim='nvim'
alias vi='vim'
alias v='vim'
alias m='make -j8'
alias n='ninja'
alias q='kiro-cli'
alias g='git'
alias gitk='gitk -n100'
alias s='sync'
alias ss='kitten ssh'
alias ssh='kitten ssh'
alias d='dtrx'
alias ckermit='ckermit -c'
alias kermit0='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyS0'
alias kermit1='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyUSB0'
alias kermit2='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyUSB1'
alias kermit3='ckermit -c -y /home/$(whoami)/.kermrc -l /dev/ttyUSB2'
alias i3lock='i3lock --color=000000'
alias sudo='sudo '

if [[ "$OSTYPE" == "darwin"* ]]; then
alias md5sum='md5'
else
alias rm='rm --one-file-system'
fi

# shellcheck disable=SC1090
[[ -s "$HOME"/.bash_aliases.private ]] && source "$HOME"/.bash_aliases.private
