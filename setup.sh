#!/bin/bash

ln -s /home/ghost/code/my_dotfiles/.zshrc .
ln -s ~/code/my_dotfiles/.vimrc .
ln -s ~/code/my_dotfiles/.tmux .
ln -s ~/code/my_dotfiles/.tmux.conf .
ln -s ~/code/my_dotfiles/.dir_colors .


brew install vim

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# /Users/kc/.vim/bundle/ListToggle/plugin/listtoggle.vim
# change <leader>q -> <leader>h

# update ~/.zprezto/runcoms/zpreztorc
# zstyle ':prezto:load' pmodule
# ...
#   'completion' \
#   'git' \
#   'syntax-highlighting' \
#   'history-substring-search' \
#   'prompt'

# zstyle ':prezto:module:editor' key-bindings 'vi'
# zstyle ':prezto:module:git:status:ignore' submodules 'all'
