-- 使用相对行号
vim.o.number = true
vim.o.relativenumber = true

-- 启用语法高亮
vim.opt.syntax = 'on'

-- 高亮所在行
vim.wo.cursorline = true
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "100"

-- 启用文件类型检测和插件
vim.opt.filetype = 'on'

-- 设置颜色主题为 monokai
vim.cmd('colorscheme monokai')

-- 启用显示可见字符
vim.opt.list = true
vim.opt.listchars:append({ tab = '->', trail = '.' })

-- 启用自动缩进
vim.opt.autoindent = true

-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 20
vim.o.sidescrolloff = 8

-- 针对 quickfix 窗口设置高度
vim.cmd('autocmd FileType qf setlocal winheight=14')

