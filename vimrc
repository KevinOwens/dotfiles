call plug#begin('~/.vim/plugged')

" Basic
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'shime/vim-livedown'
Plug 'mattn/emmet-vim'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'slim-template/vim-slim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'

" Ruby/Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'slime-lang/vim-slime-syntax'
Plug 'w0rp/ale'



call plug#end()

let mapleader = " " 	"Set the leader to the spacebar
colorscheme molokai "jellybeans

filetype plugin indent on "Required for 'vim-clojure-static'
syntax on 		"Enable syntax highlighting

set nocompatible
set ruler           	"Always show cursor position
set t_Co=256        	"Use 256 Colors in Terminal
set history=500     	"Keep 500 lines of command history
set laststatus=2    	"Always display status line
set number 	    	"Display line numbers on the left
set backupdir=~/.tmp    "Put tmp and swp files in one place
set directory=~/.tmp 	"Put tmp and swp files in one place
set nowrap 		"Dont wrap text
set autoindent     	"Always set autoindenting on
set updatetime=250 	"updatetime to 250ms so gitgutter responds quicker (default is 4s)
set showcmd
set smarttab
set splitbelow
set splitright
set shiftwidth=2
set et
set tabstop=2
set visualbell
set t_vb=

" Previous File
map <Leader>l :e#<CR>

" NERDTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR> "Map NERDTree toggle to Ctrl+n

" Fugitive (Git)
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>

" CtrlP
map <Leader>p :CtrlP<CR>

" Elixir
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['elixir'] = ['mix_format']
let g:ale_linters = {}
let g:ale_linters['elixir'] = ['credo'] " mix stops phoenix code reloading
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never' " or 'normal' or 'never'
let g:ale_lint_delay = 1000

let g:ale_elixir_elixir_ls_release = '/Users/kevinowens/.dotfiles/vim/plugin/elixir-ls/rel'

" Use Silver Searcher instead of grep
set grepprg=ag

" VIM Livedown (Markdown Preview, https://github.com/shime/vim-livedown)
let g:livedown_autorun = 1 " should markdown preview get shown automatically upon opening markdown buffer
"let g:livedown_open = 1 " should the browser window pop-up upon previewing
"let g:livedown_browser = "chrome"  "the browser to use
map <Leader>md :LivedownToggle<CR>

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

augroup myfiletypes
  autocmd FileType clojure setlocal colorcolumn=80
  autocmd FileType ruby,yaml setlocal colorcolumn=80
augroup END
