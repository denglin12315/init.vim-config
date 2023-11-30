" ================== vim-gutentags插件配置
" GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，其他语言使用 pygments 模块
let $GTAGSLABEL = 'native-pygments'
" 必须设置，否则会找不到 native-pygments 和 language map 的定义。ubuntu下要到 /etc/gtags/ 里找
let $GTAGSCONF = '/etc/gtags/gtags.conf'
" gutentags搜索工程根目录的标志，碰到这些文件/目录名就代表找到了工程的根目录，停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启ctags和gtags支持
let g:gutentags_modules = []
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
" global安装好以后，有global、gtags、gtags-cscope三个命令。global是查询，gtags是生成索引文件，gtags-cscope是与cscope一样的界面
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的tags文件全部放入~/.cache/tags目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测~/.cache/tags不存在就新建
if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
endif

" 配置ctags的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 启用gutentags自动加载gtags数据库的行为
let g:gutentags_auto_add_gtags_cscope = 1
" Change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" Enable advanced commands: GutentagsToggleTrace, etc.
let g:gutentags_define_advanced_commands = 1
let g:gutentags_trace = 0

" 配置gtags-cscope的参数
if has("cscope")        " vim的一种内置函数，用于检查当前vim是否支持cscope的功能
        if executable('gtags-cscope') && executable('gtags')
                "禁用原GscopeFind按键映射
                let g:gutentags_plus_nomap = 1
                "Find this C symbol 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
                nmap <C-\>s :GscopeFind s <C-R>=expand("<cword>")<CR><CR>
                "Find this difinition 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
                nmap <C-\>g :GscopeFind g <C-R>=expand("<cword>")<CR><CR>
                "Find functions called by this function 查找本函数调用的函数
                nmap <C-\>d :GscopeFind d <C-R>=expand("<cword>")<CR><CR>
                "Find functions calling this function 查找调用本函数的函数
                nmap <C-\>c :GscopeFind c <C-R>=expand("<cword>")<CR><CR>
                "Find this text string 查找指定的字符串
                nmap <C-\>t :GscopeFind t <C-R>=expand("<cword>")<CR><CR>
                "Find this egrep pattern 查找egrep模式，相当于egrep功能，但查找速度快多了
                nmap <C-\>e :GscopeFind e <C-R>=expand("<cword>")<CR><CR>
                "Find this file 查找并打开文件，类似vim的能
                nmap <C-\>f :GscopeFind f <C-R>=expand("<cfile>")<CR><CR>
                "Find files #including this file 查找包含本文件的文件
                nmap <C-\>i :GscopeFind i ^<C-R>=expand("<cfile>")<CR>$<CR>
        endif
endif

