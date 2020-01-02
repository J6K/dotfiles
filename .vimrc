set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'lifepillar/vim-solarized8'

call vundle#end()

filetype plugin indent on

syntax on
set background=dark
colorscheme solarized8

set ruler
set number
set modelines=0
set mouse=a    
set backspace=2
set showmatch
set clipboard=unnamed

" tabs
set tabstop=10
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

" NERDtree
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

