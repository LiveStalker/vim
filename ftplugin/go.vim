" Options
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Tagbar options
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

" Mapping
" Show a list of interfaces which is implemented by the type under your cursor
nmap <buffer><Leader>s <Plug>(go-implements)
" Show type info for the word under your cursor
nmap <buffer><Leader>i <Plug>(go-info)
" Open the relevant Godoc for the word under the cursor
nmap <buffer><Leader>gd <Plug>(go-doc)
nmap <buffer><Leader>gv <Plug>(go-doc-vertical)
" Open the Godoc in browser
nmap <buffer><Leader>gb <Plug>(go-doc-browser)
" Run/build/test/coverage
nmap <buffer><leader>r <Plug>(go-run)
nmap <buffer><leader>b <Plug>(go-build)
nmap <buffer><leader>t <Plug>(go-test)
nmap <buffer><leader>c <Plug>(go-coverage)

" Abbreviations
iabbrev <buffer> imp import
