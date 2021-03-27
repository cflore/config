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
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

let g:netrw_banner = 0
let g:newrw_browse_split = 0

let mapleader = " "

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

nnoremap <C-p> :GFiles<CR>

nnoremap <leader>gc :GCheckout<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup trim_whitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
