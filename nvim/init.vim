" basic settings
set number
set noswapfile
set bg=dark
set clipboard=unnamedplus

let mapleader = ","
au TextYankPost * silent! lua vim.highlight.on_yank()

filetype plugin on


" Plugins
call plug#begin()	

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'

call plug#end() 


colorscheme gruvbox

" Remaps
nmap <C-P> :FZF<CR>

