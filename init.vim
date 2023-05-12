" ================== nvim包含插件列表
call plug#begin('~/.config/nvim/plugged')
" 语法格式：Plug后面跟插件的github地址
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'	" 提供GscopeFind命令的插件
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'		" nerdtree支持
Plug 'Xuyuanp/nerdtree-git-plugin' 	" 显示nredtree中文件和目录的Git状态标志
Plug 'ryanoasis/vim-devicons'		" 支持nredtree中文件和目录的图标
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 支持高亮显示nredtree中的图标
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
call plug#end()

set nu
syntax on
colorscheme monokai

" ================== vim-airline插件配置
" -- 启用标签栏
let g:airline#extensions#tabline#enabled = 1
" -- 设置标签栏分隔符
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" -- 设置标签栏格式
let g:airline#extensions#tabline#formatter = 'default'
" -- 设置标签栏样式
let g:airline_theme = 'desertink'
" -- 设置标签栏字体
let g:airline_powerline_fonts=1
"-- 快捷键e切换到前一个标签
nmap e <Plug>AirlineSelectPrevTab
"-- 快捷键E切换到后一个标签
nmap E <Plug>AirlineSelectNextTab

" ================== vim-gutentags插件配置
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
if has("cscope") 	" vim的一种内置函数，用于检查当前vim是否支持cscope的功能
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

" ===============配置nerd-tree的参数
nnoremap <F2> :NERDTreeToggle<CR>
" 自动开启nerdtree
" autocmd vimenter * NERDTree
" 设定nerdtree的窗口大小
" let g:NERDTreeWinSize = 25
" 打开nerdtree时自动显示bookmarks
let NERDTreeShowBookmarks=1
" 打开nvim时若没有任何文件，则自动打开nerdtree
autocmd vimenter * if !argc()|NERDTree|endif
" 当nerdtree为唯一视窗时，自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的图标,以区分已打开或未打开
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 是否显示行号
let g:NERDTreeShowLineNumbers=0
" 是否显示隐藏文件
let g:NERDTreeHidden=0
" 让nerdtree更漂亮
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 过滤不显示的文件
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" nerdtree的git文件状设置
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
" 为不同的文件进行不同的高亮上色
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['c'] = s:blue " sets the color of c files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" ===============配置taglist的参数
let Tlist_Auto_Open=0			" 不自动打开taglist窗口
let Tlist_Show_One_File=1		" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1		" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags"	" 将taglist与ctags关联
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Display_Tag_Scope=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Dold_Column=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1		" taglist窗口停靠到右边
let Tlist_Use_SingleClick=1
nnoremap <F3> :TlistToggle<CR>

" ==============配置quickfix参数
autocmd FileType qf setlocal winheight=10	" quickfix 窗口高度设置为10,默认为4

" ==============配置youCompleteMe参数
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'
"自动触发补全(同时，也支持ctrl+z手动触发)
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }



