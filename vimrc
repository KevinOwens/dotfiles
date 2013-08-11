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
filetype plugin on
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
" Use Ack instead of grep
set grepprg=ack

" =======================================================
" Custom Mappings
" =======================================================

" Leader
let mapleader = " "

map 0 ^
map 1 $
map :W :w
map 2 :NERDTreeToggle<cr>
" let NERDTreeQuitOnOpen = 1

map <Leader>I gg=G
" open general notes in new buffer
map <Leader>nn :vsp ~/Dropbox/KevinOwens/programming_notes.txt<cr>
map <Leader>vn :vsp ~/Dropbox/KevinOwens/vim_notes.txt<cr>

" vim-rails single char commands
map <Leader>rm :Rmodel
map <Leader>rt :Runittest
map <Leader>rc :Rcontroller
map <Leader>rv :Rview

" vim-rails two char vsplit commands
map <Leader>vm :Vmodel<CR>
map <Leader>vt :Vunittest<CR>
map <Leader>vc :Vcontroller<CR>
map <Leader>vv :Vview<CR>

" make the arrow keys move within wrapped lines
map <Up> gk
imap <Up> <C-o>gk
map <Down> gj
imap <Down> <C-o>gj

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" =======================================================
" Git/Fugitive Mappings
" =======================================================
map <Leader>gs :Gstatus<CR>
map <Leader>gcm :Gcommit -m ""<LEFT>
map <Leader>gcam :Gcommit -a -m ""<LEFT>
map <Leader>gd :Gdiff
map <Leader>gb :Gblame<CR>

