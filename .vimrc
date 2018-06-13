set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
""" Plugin manager
Plugin 'VundleVim/Vundle.vim'

""" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

""" Go
Plugin 'fatih/vim-go'

""" Bash
Plugin 'vim-scripts/bash-support.vim'

""" Clang
Plugin 'WolfgangMehner/c-support'

""" Appearance and layout
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/peaksea'

""" Misc
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete.vim'
Plugin 'cespare/vim-toml'
Plugin 'nelstrom/vim-markdown-folding'

call vundle#end()
filetype plugin indent on

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" General
"""""""""""""""""""""""""""""""""""""""""""""""""
set history=500      " set how many lines of history VIM has to remember
set autoread         " set to auto read when a file is changed the outside
set noexrc           " do not use other .*rc(s)
set ffs=unix,dos,mac " use Unix as the standard file type

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let maplocalleader = "\\"

" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""
set hidden                  " do not unload buffer when it abandoned
set cursorline              " highlite cursor line
set more                    " -more- like less
set number                  " line numbers
set scrolloff=7             " lines above/below cursor
set showcmd                 " show cmds being typed
set title                   " window title
set wildmenu                " better cmd-completion (wildmode=full)
set wildignore=*.o,*~,*.pyc " ignore compiled files
set noshowmode              " hide mode in status line
set laststatus=2            " always show statusline

" search
set ignorecase              " case insensitive search
set smartcase               " undo ignorecase if pattern contain Upper letters
set hlsearch                " highlight all search results
set incsearch               " "live"-search

" match
set showmatch               " show matching brackets when text indicator is over them
set matchtime=2             " time to blink match brackets
set matchpairs+=<:>         " additional brackets

set noerrorbells            " no annoying sound on errors
set novisualbell
set t_vb=

set timeoutlen=500

" fold
set foldcolumn=1            " fold column
set foldmethod=indent       " folds using indent
set foldnestmax=10          " max 10 nested folds
set foldlevelstart=99       " folds open by default

" indent
set autoindent             " use indentation of previous line
set smartindent            " use intelligent indentation for C
set tabstop=4              " tab width is 4 spaces
set expandtab              " expand tabs to spaces
set softtabstop=4          " soft like tabstop
set shiftwidth=4           " indent also with 4 spaces
set nowrap                 " do not wrap lines
set noequalalways          " do not maintain window-size ratio (when having multiple window splits I don't find it desirable)
set textwidth=120          " wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.

set list                    " display listchars
set listchars=tab:>·,trail:·,extends:>

set colorcolumn=160         " higlight 160 column

" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set t_Co=256                " 256-colors
set background=dark         " using dark background
colors jellybeans           " color schema

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""
" improver
inoremap jk <esc>
inoremap <esc> <nop>

" Fast saving
nnoremap <leader>w :w!<cr>

" quickly edit/source .vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" turn off hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" turn on/off listchars
nnoremap <leader>l :set list!<CR>

" toggle current fold open/closed
nnoremap <Space> za

" walk through buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" toggle the NERDTree file browser
noremap <F2> :NERDTreeToggle<CR>

" toggle pastemode, doesn't indent
set pastetoggle=<F3>

" toggle taglist (definitions, functions etc.)
nnoremap <F8> :TagbarToggle<CR>
