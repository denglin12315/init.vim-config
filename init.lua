-- nvim包含插件列表
vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

packer.startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- List your plugins here
	use 'ludovicchabant/vim-gutentags'
	use 'skywind3000/gutentags_plus'
	use 'crusoexia/vim-monokai'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'preservim/nerdtree'
	use 'Xuyuanp/nerdtree-git-plugin'
	use 'ryanoasis/vim-devicons'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'vim-scripts/taglist.vim'
	use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
	use 'junegunn/fzf.vim'
	use {'neoclide/coc.nvim', branch = 'release'}
	use 'APZelos/blamer.nvim'
	use 'rust-lang/rust.vim'
	use 'skywind3000/vim-preview'
	use 'Chiel92/vim-autoformat'
	use 'godlygeek/tabular'
	use 'preservim/vim-markdown'
	use 'iamcco/mathjax-support-for-mkdp'
	use 'iamcco/markdown-preview.vim'
end)

-- nvim基础配置
require("general")

-- 各个插件配置
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/airline.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/gutentags.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/nerdtree.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/taglist.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/coc.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/gitblamer.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/vim-preview.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/vim-format.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/markdown.vim]], false)
vim.api.nvim_exec([[source ~/.config/nvim/lua/plugin/config/rust.vim]], false)


