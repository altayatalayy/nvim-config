require("user.settings")
require("user.keymaps")
require("user.autocmds")

-- clone lazy and add it to the rtp
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup("user.plugins")

-- autocommand for detecting zsh functions
local zdotdir = os.getenv("ZDOTDIR") or ""
if zdotdir ~= "" then
    local functions_dir = zdotdir .. "/functions/*"

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = functions_dir,
        callback = function()
            vim.bo.filetype = "zsh"
        end,
    })
end
