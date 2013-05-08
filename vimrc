" =======================================================
" Pathogen 
" =======================================================
execute pathogen#infect()
execute pathogen#helptags()

" =======================================================
" Ruby
" =======================================================

" =======================================================
" Basic Settings
" =======================================================

set nocompatible
filetype plugin indent on
syntax on

set nobackup
set nowritebackup
set t_Co=256
set history=500
set ruler
set showcmd
set autoindent
set showmatch
set nowrap
set et
set sw=2
set smarttab
set ignorecase smartcase
set noesckeys
set number
set numberwidth=5
set splitbelow
set splitright
"set colorcolumn=80
"set laststatus=2
set backspace=indent,eol,start

" =======================================================
" Custom Mappings
" =======================================================
map 0 ^
map 1 $
map :W :w
let mapleader = ","
" let NERDTreeQuitOnOpen = 1

map <Leader>I gg=G
" open general notes in new buffer
map <Leader>nn :vsp ~/Dropbox/KevinOwens/programming_notes.txt<cr>
map <Leader>vn :vsp ~/Dropbox/KevinOwens/vim_notes.txt<cr>

" vim-rails single char commands
map <Leader>m :Rmodel
map <Leader>t :Runittest
map <Leader>c :Rcontroller
map <Leader>v :Rview

" vim-rails two char vsplit commands
map <Leader>vm :Vmodel
map <Leader>vt :Vunittest
map <Leader>vc :Vcontroller
map <Leader>vv :Vview

" =======================================================
" Git/Fugitive Mappings
" =======================================================
map <Leader>gs :Gstatus<CR>
map <Leader>gcm :Gcommit -m ""<LEFT>
map <Leader>gcam :Gcommit -a -m ""<LEFT>
map <Leader>gd :Gdiff

