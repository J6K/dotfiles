" ============================
" Basic Settings
" ============================
set nocompatible " Use Vim settings, not vi
syntax on " Enable syntax highlighting
set number " Show absolute line numbers
set cursorline " Highlight current line
set mouse=a " Enable mouse support
set clipboard=unnamedplus     " Use system clipboard everywhere
set hidden " Allow background buffers
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
nnoremap <D-s> :w<CR> " Cmd+S = Save
nnoremap <D-q> :q<CR> " Cmd+Q = Quit
nnoremap <D-a> ggVG " Cmd+A = Select all
nnoremap <D-c> "+y " Cmd+C = Copy
vnoremap <D-c> "+y " Cmd+C in visual mode
nnoremap <D-v> "+p " Cmd+V = Paste
inoremap <D-v> <C-r>+ " Cmd+V in insert mode

" Windows-specific tweaks
if exists("g:is_win")
  nnoremap <A-Left> b
  nnoremap <A-Right> e
endif

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
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ============================
" Colorscheme (after plugins)
" ============================
set background=dark
try
    colorscheme solarized
    highlight Normal ctermbg=NONE  " Transparent background if supported
catch /^Vim\%((\a\+)\)\=:E185/
    " Ignore error if colorscheme not installed yet
endtry

" ============================
" Extra UX Settings
" ============================
set splitbelow splitright       " Open splits more naturally
set ignorecase smartcase        " Case-insensitive search unless caps
set incsearch " Incremental search
set hlsearch " Highlight search matches