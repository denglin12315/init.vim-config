-- 使用相对行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 启用语法高亮
vim.opt.syntax = 'on'

-- 高亮所在行
vim.opt.cursorline = true
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.opt.colorcolumn = "100"

-- 启用文件类型检测和插件
vim.opt.filetype = 'on'

-- 设置颜色主题为 monokai
vim.cmd('colorscheme monokai')

-- 启用显示可见字符
vim.opt.list = true
vim.opt.listchars:append({tab = '▸ ', trail = '·'})

-- 启用自动缩进
vim.opt.autoindent = true

-- jkhl 移动时光标周围保留8行
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- 针对 quickfix 窗口设置高度
vim.cmd('autocmd FileType qf setlocal winheight=14')

-- terminal 模式
-- Define a Lua function to split the window vertically and enter terminal mode
function split_and_terminal()
    vim.cmd('vsplit') -- Split the window vertically
    vim.cmd('wincmd l') -- Move to the right window
    vim.cmd('terminal') -- Enter terminal mode
    vim.cmd('set norelativenumber') -- Disable relative line numbers
    vim.cmd('set nu!') -- Toggle line numbers
end
-- Define a Lua function to close the current vsplit window
function close_vsplit()
    vim.cmd('q') -- Close the vsplit window
end
-- Map the Lua functions to commands
vim.cmd('command! TS lua split_and_terminal()')
vim.cmd('command! TC lua close_vsplit()')
