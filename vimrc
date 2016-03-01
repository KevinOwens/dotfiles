call plug#begin('~/.vim/plugged')

" Basic
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'

" Clojure

" Ruby/Rails 
Plug 'tpope/vim-rails'

call plug#end()

let mapleader = " " "Set the leader to the spacebar
set ruler           "Always show cursor position
set t_Co=256
set history=500
set laststatus=2
