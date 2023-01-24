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
    termguicolors = true,
    fileencoding = 'utf-8',
    undofile = true, -- Enable persistent undo
    updatetime = 100, -- faster completion (default 4000ms)
    timeoutlen = 150, -- key combination timeout
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
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
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smarttab = true,
    smartindent = true,
    wrap = false,
    scrolloff = 8, -- fix scroll
    sidescrolloff = 8,
    clipboard = 'unnamedplus',
    signcolumn = 'yes',
    foldcolumn = '1', -- fold configurations
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    ignorecase = true,
    splitbelow = true, -- fix splits
    splitright = true,
    lazyredraw = true, -- dont draw while executing a macro
    list = true,
    joinspaces = false, -- fix joining lines, dont insert extra space in between elements
    virtualedit = 'block', -- allow cursor to move any where while in visual block (ctrl-p)
    conceallevel = 0, -- so that `` is visible in markdown files
    cmdheight = 0,
    completeopt = { "menu", "menuone", "noselect" },
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.spelllang:append "cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "I" -- don't show the default intro message

-- display these characters when present
vim.cmd([[ set listchars=nbsp:⦸ ]])
vim.cmd([[ set listchars+=tab:▷- ]])
vim.cmd([[ set listchars+=trail:• ]])

vim.cmd([[ set whichwrap=b,h,l,s,<,>,[,],~ ]]) -- cross line boundaries with <BS>/h/l/<Left>/<Right>/<Space>

vim.cmd([[ command! -nargs=* W wa ]]) -- -> :W = :wa
vim.cmd([[ command! -nargs=* Q qa ]]) -- -> :Q = :qa


-- fix create a new line with comments
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- highight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() 
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
    end 
})

vim.g.mkdp_filetypes = { "markdown" }
