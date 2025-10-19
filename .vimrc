" ============================
" Basic Settings
" ============================
set nocompatible              " Use Vim settings, not vi
syntax on                     " Enable syntax highlighting
set number                    " Show line numbers
set relativenumber            " Relative numbers
set cursorline                " Highlight current line
set mouse=a                   " Enable mouse support
set clipboard=unnamedplus     " Use system clipboard everywhere
set hidden                    " Allow background buffers
set tabstop=4 shiftwidth=4 expandtab  " Spaces instead of tabs

" ============================
" Detect OS
" ============================
if has("macunix")
  let g:is_mac = 1
elseif has("win32") || has("win64")
  let g:is_win = 1
endif

" ============================
" Keybindings (Mac layout priority)
" ============================
" Command-like bindings (mac first)
nnoremap <D-s> :w<CR>          " Cmd+S = Save
nnoremap <D-q> :q<CR>          " Cmd+Q = Quit
nnoremap <D-a> ggVG            " Cmd+A = Select all
nnoremap <D-c> "+y             " Cmd+C = Copy to clipboard
vnoremap <D-c> "+y             " Cmd+C in visual mode
nnoremap <D-v> "+p             " Cmd+V = Paste
inoremap <D-v> <C-r>+          " Cmd+V in insert mode

" Windows-specific tweaks
if exists("g:is_win")
  " Sometimes Alt/Meta keys behave differently on Windows terminals
  nnoremap <A-Left> b
  nnoremap <A-Right> e
endif

" ============================
" Colorscheme
" ============================
set background=dark
colorscheme solarized          " Requires solarized installed
highlight Normal ctermbg=NONE  " Transparent background if supported

" ============================
" Plugin Manager (vim-plug)
" ============================
" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Popular & useful plugins
Plug 'tpope/vim-sensible'           " Reasonable defaults
Plug 'altercation/vim-colors-solarized' " Solarized theme
Plug 'tpope/vim-surround'           " Surround text easily
Plug 'junegunn/fzf.vim'             " Fuzzy finder
Plug 'airblade/vim-gitgutter'       " Git diff markers
Plug 'preservim/nerdtree'           " File tree explorer
Plug 'vim-airline/vim-airline'      " Status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense-like completion

call plug#end()

" ============================
" Extra UX Settings
" ============================
set splitbelow splitright       " Open splits more naturally
set ignorecase smartcase        " Case-insensitive search unless caps
set incsearch                   " Incremental search
set hlsearch                    " Highlight search matches
