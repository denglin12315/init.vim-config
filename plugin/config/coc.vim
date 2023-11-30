" ==============配置coc自动补全
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <Tab>
                        \ coc#pum#visible() ? coc#pum#next(1) :
                        \ CheckBackspace() ? "\<Tab>" :
                        \ coc#refresh()

" Use <Tab> and <Shift-Tab> to navigate the completion list
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use coc#pum#info() if you need to confirm completion, only when there's selected complete item
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

