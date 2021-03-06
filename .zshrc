#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Customize to your needs...
#
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    if [[ ! -s "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]]; then
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    fi
done

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# export spx="${spx:--mac}"
if [ -e ~/code/my_dotfiles/.bashrc_local ]; then
  source ~/code/my_dotfiles/.bashrc_local
fi

if [[ `uname` =~ "Darwin" ]]; then
    if brew list --formula | grep coreutils > /dev/null ; then
        PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        alias ls='ls -F --show-control-chars --color=auto'
        eval `gdircolors -b $HOME/.dir_colors`
    fi
fi


export PATH=/usr/local/go/bin:$PATH
export GOHOME=$HOME/gocode


#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% VIM]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select
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

# export GREP_OPTIONS='--color=auto'

# For Linux
export GREP_COLORS="sl=97;48;5;236:cx=37;40:mt=30;48;5;186:fn=38;5;197:ln=38;5;154:bn=38;5;141:se=38;5;81"

# For MacOS
export GREP_COLOR='1;35;40'

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

export PATH="/usr/local/bin:$PATH:$HOME/.toolbox/bin"
alias rdpproxy='ssh -N -L 13390:localhost:3389 clouddesk &'

export EDITOR=vim
export VISUAL=vim

source /usr/local/bin/aws_zsh_completer.sh

alias ghost='ssh ghost@ghost'
alias wireshark='sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark &'

export PATH=$PATH:~/.cargo/bin
export CC=gcc-10
export CXX=g++-10

alias j8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'
alias j11='export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11jdk/Contents/Home'
alias j15='export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-15jdk/Contents/Home'
export PATH="/usr/local/opt/llvm/bin:$PATH"


# Clang fix
export CC=/usr/local/opt/llvm/bin/clang CXX=/usr/local/opt/llvm/bin/clang++
export CPLUS_INCLUDE_PATH=/usr/local/opt/llvm/include/c++/v1:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export LIBRARY_PATH=$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
