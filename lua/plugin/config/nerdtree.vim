" ===============配置nerd-tree的参数
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

nnoremap <F5> :NERDTreeToggle<CR>
