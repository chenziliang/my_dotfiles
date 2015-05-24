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

if [ -e ~/Work/.dotfiles/.bashrc_local ]; then
  source ~/Work/.dotfiles/.bashrc_local
fi

if brew list | grep coreutils > /dev/null ; then
    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    alias ls='ls -F --show-control-chars --color=auto'
    eval `gdircolors -b $HOME/.dir_colors`
fi


export SPLUNK_HOME=/Applications/Splunk
#export DYLD_LIBRARY_PATH=$SPLUNK_HOME/lib
export SPLUNK_DB=$SPLUNK_HOME/var/lib/splunk
#export PATH=$PATH:/Applications/Splunk/bin

export PATH=$PATH:/usr/local/Cellar/cvs/1.12.13/bin
source /usr/local/bin/virtualenvwrapper.sh

export P4PORT=sh-p4broker.sv.splunk.com:1667
export P4USER=kchen
export P4CLIENT=Kens-MacBook-Pro
export SOLN_ROOT=/Users/Ken/Work/Perforce/kchen_Kens-MacBook-Pro_9471/solutions
export CODELINE=mainline

export PATH=/usr/local/go/bin:$PATH
export GOHOME=$HOME/gocode

#source /Applications/Splunk/bin/setSplunkEnv
source ~/.winpdb


function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% VIM]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

alias ..="cd .."
alias ...="cd ../.."

gopath(){
    export GOPATH=$GOHOME/"${1}"
}

check_style(){
    python /Users/Ken/Work/AddOn/Shanghai-TA-repo/TA-tools/mainline/package/python_scripts/title_style_check.py "${1}"
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

export repo=/Users/Ken/Work/Perforce/kchen_Kens-MacBook-Pro_9471/solutions/TA
export app=/Applications/Splunk/etc/apps

ulimit -n 10240
ulimit -c unlimited
