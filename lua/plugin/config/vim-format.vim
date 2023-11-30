" ==============配置clang-format
let g:clang_format#command = 'clang-format'
let g:clang_format#detect_style_file = 1
" au BufWrite * :Autoformat    " 保存时自动格式化
noremap <F4> :Autoformat<CR>

