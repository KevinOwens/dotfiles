call plug#begin('~/.vim/plugged')

" Basic
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Colors
Plug 'nanotech/jellybeans.vim'

" Clojure
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'

" Ruby/Rails 
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

call plug#end()

colorscheme jellybeans " Set the colorscheme

let mapleader = " " 	"Set the leader to the spacebar
set nocompatible
set ruler           	"Always show cursor position
set t_Co=256        	"Use 256 Colors in Terminal
set history=500     	"Keep 500 lines of command history
set laststatus=2    	"Always display status line 
set number 	    	"Display line numbers on the left
set backupdir=~/.tmp    "Put tmp and swp files in one place
set directory=~/.tmp 	"Put tmp and swp files in one place
set nowrap 		"Dont wrap text
set showcmd
set smarttab

map <C-n> :NERDTreeToggle<CR> "Map NERDTree toggle to Ctrl+n

" CtrlP
map <Leader>p :CtrlP<CR>

" Use Silver Searcher instead of grep
set grepprg=ag


"Exit Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Reload this file (vimrc) everytime it's saved
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

nnoremap <leader>evrc :split $MYVIMRC<CR>  " Quickly open vimrc
nnoremap <leader>svrc :source $MYVIMRC<CR> " Quickly reload vimrc

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  
  " Use ag in CtrlP for listing files. Lightning fast and respect .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
