set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'elixir-lang/vim-elixir'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?
set nu
