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
Plugin 'sickill/vim-monokai'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mileszs/ack.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.md set filetype=markdown
au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
set nu
set hlsearch
set incsearch
set autoindent
set fileformat=unix
set splitbelow
set splitright
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
map <C-n> :NERDTreeToggle<CR>
colorscheme monokai
syntax on
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
