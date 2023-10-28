return {
    'folke/which-key.nvim',
    keys = "<leader>",
    config = function ()
        local wk_status_ok, wk = pcall(require, "which-key")
        if not wk_status_ok then
            return
        end

        wk.setup({
            plugins = {
                marks = false, -- shows a list of your marks on ' and `
                registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false, -- adds help for operators like d, y, ...
                    motions = false, -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = false, -- default bindings on <c-w>
                    nav = false, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
                spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
            },
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 5, -- spacing between columns
                align = "center", -- align columns left, center or right
            },
        })

        wk.register({
            ["<leader>t"] = { name = '+Telescope' },
            ["<leader>l"] = { name = '+LSP' },
            ["<leader>lw"] = { name = '+workspace' },
            ["<leader>d"] = { name = '+DAP' },
            ["<leader>n"] = { name = '+NvimTree' },
            ["<leader>g"] = { name = '+git' },
            ["<leader>b"] = { name = '+buffer' },
            ["<leader>w"] = { name = '+window' },
            ["<leader>h"] = { name = '+harpoon' },
        }, 
        { mode = 'n', silent = true, noremap = true, })
    end
}
