set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set signcolumn=yes
set updatetime=50
set colorcolumn=80
set termguicolors
set shortmess+=c
set background=dark
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/symbols-outline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'

call plug#end()

lua require("cflore")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox
highlight Normal guibg=none

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

inoremap jj <Esc>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>m :MaximizerToggle!<CR>

augroup cflore
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
