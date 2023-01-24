return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    keys = {
        {'<leader>nf', function () require('nvim-tree').focus() end, desc = 'focus' },
        {'<leader>nt', function () require('nvim-tree').toggle() end, desc = 'toggle' },
    },
    ft = {"netrw"},
    --event = "VeryLazy",
    lazy = false,
    config = function ()
        local status_ok, nvimtree = pcall(require, "nvim-tree")
        if not status_ok then return end

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            diagnostics = {
                enable = true,
                show_on_dirs = false,
            }
        })

        --vim.keymap.set('n', '<leader>nf', function () nvimtree.focus() end, { desc = 'focus' })
        --vim.keymap.set('n', '<leader>nt', function () nvimtree.toggle() end, { desc = 'toggle' })
    end
}
