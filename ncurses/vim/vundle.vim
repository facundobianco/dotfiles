" Vundle begin
" vim +PluginInstall +qall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'cespare/vim-toml'
Plugin 'hashivim/vim-terraform'
call vundle#end()
filetype plugin indent on
