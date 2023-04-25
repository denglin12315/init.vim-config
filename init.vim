set nu

" ================== nvim包含插件列表
call plug#begin('~/.config/nvim/plugged')
Plug 'ludovicchabant/vim-gutentags'	" github地址
call plug#end()

" ================== vim-gutentags插件配置
" gutentags搜索工程根目录的标志，碰到这些文件/目录名
" 就代表找到了工程的根目录，停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的tags文件全部放入~/.cache/tags目录中，避
" 免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

