vim.g.mapleader = " "

-- headless options
if #vim.api.nvim_list_uis() == 0 then
	vim.opt.shortmess = "" -- try to prevent echom from cutting messages off or prompting
	vim.opt.more = false -- don't pause listing when screen is filled
	vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
	vim.opt.columns = 9999 -- set the widest screen possible
	vim.opt.swapfile = false -- don't use a swap file
	vim.opt.termguicolors = true
	return
end

local options = {
	termguicolors = true, -- True color support
	spelllang = { "en" },
	fileencoding = "utf-8",
	
    updatetime = 100, -- faster completion (default 4000ms)
	timeoutlen = 250, -- key combination timeout

	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs

	undofile = true, -- Enable persistent undo
	swapfile = false,
	backup = false, -- disable backupfile

	laststatus = 3,
	incsearch = true,
	hlsearch = false,

	number = true,
	relativenumber = true,
	numberwidth = 3,
	ruler = true,
	cursorline = true,

	tabstop = 4, -- Number of spaces tabs count for
	shiftwidth = 4, -- Size of an indent
	softtabstop = 4,
	expandtab = true, -- Use spaces instead of tabs
	smarttab = true,
	smartindent = true, -- Insert indents automatically
	shiftround = true, -- Round indent to multiples of shiftwidth

	wrap = false,
	scrolloff = 8, -- fix scroll
	sidescrolloff = 8,
	clipboard = "unnamedplus",
	signcolumn = "yes",

	-- fold configurations
	foldcolumn = "1",
	foldenable = true,
	foldlevel = 99,
	foldlevelstart = 99,

	-- fix splits
	splitbelow = true,
	splitright = true,

	lazyredraw = false, -- (Disabled) dont draw while executing a macro
	list = true, -- Show some invisible characters (tabs...
	joinspaces = false, -- fix joining lines, dont insert extra space in between elements
	virtualedit = "block", -- allow cursor to move any where while in visual block (ctrl-p)
	conceallevel = 0, -- so that `` is visible in markdown files
	cmdheight = 0,
	completeopt = { "menu", "menuone", "noselect" },
	wildmode = "longest:full,full", -- Command-line completion mode
	ignorecase = true,
	smartcase = true, -- Don't ignore case with capitals
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

vim.opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.shortmess:append("W") -- don't give "written" or "[w]" when writing a file

-- display these characters when present
vim.cmd([[ set listchars=nbsp:⦸ ]])
vim.cmd([[ set listchars+=tab:▷- ]])
vim.cmd([[ set listchars+=trail:• ]])

vim.cmd([[ set whichwrap=b,h,l,s,<,>,[,],~ ]]) -- cross line boundaries with <BS>/h/l/<Left>/<Right>/<Space>

vim.cmd([[ command! -nargs=* W wa ]]) -- -> :W = :wa
vim.cmd([[ command! -nargs=* Q qa ]]) -- -> :Q = :qa


vim.g.mkdp_filetypes = { "markdown" }
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
