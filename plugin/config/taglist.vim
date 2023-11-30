" ===============配置taglist的参数
let Tlist_Auto_Open=0                   " 不自动打开taglist窗口
let Tlist_Show_One_File=1               " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1             " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags"    " 将taglist与ctags关联
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Display_Tag_Scope=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Dold_Column=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1            " taglist窗口停靠到右边
let Tlist_Use_SingleClick=1
nnoremap <F3> :TlistToggle<CR>

