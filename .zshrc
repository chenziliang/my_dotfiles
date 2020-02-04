#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

if [ -e ~/code/my_dotfiles/.bashrc_local ]; then
  source ~/code/my_dotfiles/.bashrc_local
fi

if brew list | grep coreutils > /dev/null ; then
    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    alias ls='ls -F --show-control-chars --color=auto'
    eval `gdircolors -b $HOME/.dir_colors`
fi


export PATH=/usr/local/go/bin:$PATH
export GOHOME=$HOME/gocode


function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% VIM]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
autoload -U edit-command-line
zle -N edit-command-line

alias ..="cd .."
alias ...="cd ../.."

gopath(){
    export GOPATH=$GOHOME/"${1}"
}

strip_line(){
    echo -e "${1}" | sed -e "s/^$2//" -e "s/$2$//"
}

strip_ext(){
    echo ${1%.*}
}

cptohydra(){
    scp -r $1 hydra@172.16.107.153:$2
}
export GREP_COLOR="32;40"

ulimit -n 10240
ulimit -c unlimited

bindkey -v
bindkey 'ctrl+P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^e' edit-command-line
