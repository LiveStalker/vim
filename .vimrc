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
"Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

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
set scrolloff=3            " lines above/below cursor
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

" Quickly edit/source .vimrc
" noremap <leader>ve :edit ~/.vimrc<CR>
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader><space> :nohlsearch<CR>

" wrap up with "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>

" improver
inoremap jk <esc>
inoremap <esc> <nop>

" Toggle the NERDTree file browser
noremap <F2> :NERDTreeToggle<CR>

" Toggle pastemode, doesn't indent
set pastetoggle=<F3>

" Toggle taglist (definitions, functions etc.)
nnoremap <F8> :TagbarToggle<CR>

" autocmd
autocmd FileType make set noexpandtab

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline plugin
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
"let g:airline_powerline_fonts = 1                          " Use Powerline fonts to show beautiful symbols
let g:airline_theme = 'murmur'                              " Select 'murmur' theme as default one
let g:airline_inactive_collapse = 0                         " Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0             " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1                " Display tab bar with buffers
let g:airline#extensions#branch#enabled = 1                 " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1                 " Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 1                  " Enable Git hunks integration

"------------------------------------------------------------------------------
" Vim-go
"------------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
