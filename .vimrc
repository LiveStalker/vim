set nocompatible   " be iMproved
filetype off
set helplang=ru    " help on my native language

" Plugin settings ---------------- {{{
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
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'

call vundle#end()
" }}}

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

" Abbrev
iabbrev #i #include

" Keybindings
let mapleader=","
let maplocalleader = "\\"

" Keymap ---------------------------------------{{{
" edit .vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
" source .vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>
" turn off hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" toggle the NERDTree file browser
noremap <F2> :NERDTreeToggle<CR>
" wrap up with " in normal mode
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" toggle taglist (definitions, functions etc.)
nnoremap <F8> :TagbarToggle<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" wrap up with " in visual mode
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" improver: escape from insert mode
inoremap jk <esc>
inoremap <esc> <nop>
" toggle pastemode, doesn't indent
set pastetoggle=<F3>
" spell checking
nnoremap <F7> :set spell!<CR> 
inoremap <F7> <Esc>:set spell!<CR>
vnoremap <F7> <Esc>:set spell!<CR>
" }}}

" Spell checking ---------------------------------{{{
set spelllang=en,ru

highlight clear SpellBad 
highlight SpellBad ctermfg=Red 

highlight clear SpellCap 
highlight SpellCap ctermfg=Blue 

highlight clear SpellLocal 
highlight SpellLocal ctermfg=Green
" }}}

" Augroup ----------------------------------------{{{
augroup filetype_make
    autocmd!
    autocmd FileType make set noexpandtab
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Airline plugin ---------------------------------{{{
set laststatus=2
"let g:airline_powerline_fonts = 1                          " Use Powerline fonts to show beautiful symbols
let g:airline_theme = 'murmur'                              " Select 'murmur' theme as default one
let g:airline_inactive_collapse = 0                         " Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0             " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1                " Display tab bar with buffers
let g:airline#extensions#branch#enabled = 1                 " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1                 " Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 1                  " Enable Git hunks integration
" }}}
