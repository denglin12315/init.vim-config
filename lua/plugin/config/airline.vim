" ================== vim-airline插件配置
" -- 启用标签栏
let g:airline#extensions#tabline#enabled = 1
" -- 设置标签栏主题
let g:airline_theme = 'desertink'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_format = {
                        \ '0': '0 ',
                        \ '1': '1 ',
                        \ '2': '2 ',
                        \ '3': '3 ',
                        \ '4': '4 ',
                        \ '5': '5 ',
                        \ '6': '6 ',
                        \ '7': '7 ',
                        \ '8': '8 ',
                        \ '9': '9 '
                        \}

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

"-- 快捷键e切换到前一个标签
nmap <Tab> <Plug>AirlineSelectPrevTab
"-- 快捷键E切换到后一个标签
nmap <S-Tab> <Plug>AirlineSelectNextTab
