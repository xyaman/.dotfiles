" ONE FILE VIMRC FOR SSH

""""""
" UI "
""""""

" disable vi compatibility
set nocompatible

" automatically load changed files
set autoread

" show the filename in the window titlebar
set title

" set encoding
set encoding=utf-8

" display incomplete commands at the bottom
set showcmd

" mouse support
set mouse=a

" line numbers
set number
set relativenumber

" wrapping stuff
set nowrap
set colorcolumn=80
highlight ColorColumn ctermbg=238

" ignore whitespace in diff mode
set diffopt+=iwhite

" Be able to arrow key and backspace across newlines
set whichwrap=bs<>[]

" Status bar
set laststatus=2

set splitbelow 
set splitright
set nohls
set noswapfile
set nobackup

" remember last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

" enable completion
set ofu=syntaxcomplete#Complete
set completeopt=menu,menuone,noselect

" make laggy connections work faster
set ttyfast

" let vim open up to 100 tabs at once
set tabpagemax=100

" case-insensitive filename completion
set wildignorecase

" for :find
set path+=**
set wildignore=*/dist*/*,*/target/*,*/builds/*,*/node_modules/*
set wildmenu
set wildoptions=pum
set wildchar=<C-n>

"""""""""""""
" Searching "
"""""""""""""

set incsearch "while typing a search command, show immediately where the so far typed pattern matches
set ignorecase "ignore case in search patterns
set smartcase "override the 'ignorecase' option if the search pattern contains uppercase characters
set gdefault "imply global for new searches

"""""""""""""
" Indenting "
"""""""""""""

set tabstop=4
set shiftwidth=4
set copyindent
set autoindent

"""""""""
" Theme "
"""""""""

syntax enable
"set background=dark "uncomment this if your terminal has a dark background

colorscheme retrobox

"""""""""""""""""""""
" Remaps
"""""""""""""""""""""
let mapleader = " "

" netwr
nnoremap <leader>nt :Ex<CR>

" buffer 
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bb :ls<CR>

" visual mode defaults
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" normal mode defaults
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" replace mouse word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" quickfix list
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz

" location list
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz


" list mode (see tabs character code)
noremap <Leader><Tab><Tab> :set invlist<CR>

"""""""""""""""""""""
" Language-Specific "
"""""""""""""""""""""

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.html.erb set ft=eruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=json syntax=javascript
au BufNewFile,BufRead *.cgi set ft=cgi syntax=php

autocmd BufNewFile,BufRead ~/.vimbarria set filetype=vim
