set nocompatible   " be iMproved
filetype off
set helplang=ru    " help on my native language

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'WolfgangMehner/c-support'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

" General settings
set encoding=utf-8         " set UTF-8 encodeing
set fileencoding=utf-8
set termencoding=utf-8
set hidden                 " buffer change, more ndo
set history=200            " more history
set laststatus=2           " always show statusline
set noshowmode             " hide mode in status line
set noexrc                 " do not use other .*rc(s)
set list                   " display listchars
set list listchars=tab:>·,trail:·,extends:>

" Interface general
set cursorline             " highlite cursor line
set more                   " -more- like less
set number                 " line numbers
set scrolloff=5            " lines above/below cursor
set showcmd                " show cmds being typed
set title                  " window title
set wildmenu               " better cmd-completion (wildmode=full)

" Syntax highlighting
filetype plugin indent on  " enable ft+plugin detect
syntax on                  " syntax highlightning
set t_Co=256               " 256-colors
set background=dark        " using dark background
colors jellybeans          " color schema

" Indent
set autoindent             " use indentation of previous line
set smartindent            " use intelligent indentation for C
set tabstop=4              " tab width is 4 spaces
set shiftwidth=4           " indent also with 4 spaces
set expandtab              " expand tabs to spaces
set nowrap                 " do not wrap lines
set noequalalways          " do not maintain window-size ratio (when having multiple window splits I don't find it desirable)
set textwidth=120          " wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.

" Folding
set foldcolumn=0           " hide folding column
set foldmethod=indent      " folds using indent
set foldnestmax=10         " max 10 nested folds
set foldlevelstart=99      " folds open by default

" Search
set gdefault               " default s//g (global)
set smartcase              " Undo ignorecase if pattern contain Upper letters
set incsearch              " "live"-search
set ignorecase             " case insensitive search
set hlsearch               " highlight all search results

" Matching
set matchtime=2            " time to blink match {}
set matchpairs+=<:>        " for ci< or ci>
set showmatch              " tmp jump to match-bracket


" Keybindings
let mapleader=","

" Quickly edit/source .vimrc
noremap <leader>ve :edit ~/.vimrc<CR>
noremap <leader>vs :source ~/.vimrc<CR>

" Toggle the NERDTree file browser
noremap <F2> :NERDTreeToggle<CR>

" Toggle pastemode, doesn't indent
set pastetoggle=<F3>

" Toggle taglist (definitions, functions etc.)
map <F4> <ESC>:TlistToggle<CR>

" autocmd
autocmd FileType make set noexpandtab
