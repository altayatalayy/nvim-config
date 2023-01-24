return {
    {
        'folke/tokyonight.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function ()
            vim.cmd("colorscheme tokyonight-night")
        end
    },
    {
        'mbbill/undotree',
        keys = {
            {"<leader>u", vim.cmd.UndotreeToggle, desc = "UndotreeToggle"},
        },
        config = function ()
            --vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle"})
        end
    },

    'gpanders/editorconfig.nvim',

    {
        'rcarriga/nvim-notify',
        config = function()
            local status_ok, notify = pcall(require, 'notify')
            if not status_ok then return end

            vim.notify = function(msg, ...)
                if msg:match("warning: multiple different client offset_encodings") then
                    return
                end
                notify(msg, ...)
            end
        end
    },

    {
        'nvim-tree/nvim-web-devicons',
        event = "VeryLazy",
        config = function ()
            local status_ok, icons = pcall(require, 'nvim-web-devicons')
            if not status_ok then
                return
            end

            icons.setup({
                override = {},
                default = true
            })
        end
    },

    {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = "VeryLazy",
        keys = {
            {'<leader>gdo',  ":DiffviewOpen<CR>", desc = 'open' },
            {'<leader>gdc',  ":DiffviewClose<CR>", desc = 'close'},
            {'<leader>gdf',  ":DiffviewFileHistory<CR>", desc = 'history'},
        },
    },

    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = function ()
            local status_ok, gitsigns = pcall(require, 'gitsigns')
            if not status_ok then
              return
            end

            gitsigns.setup({
              current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
              current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 300,
                ignore_whitespace = false,
              },
            })
        end
    },

    {
        "RRethy/vim-illuminate", -- highlighting other uses of the word under the cursor
        dependencies = {
            "neovim/nvim-lspconfig",
            'nvim-treesitter/nvim-treesitter',
        },
        event = "VeryLazy",
    },

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        event = "VeryLazy",
        config = function()
            local status_ok, hop = pcall(require, 'hop')
            if not status_ok then
                return
            end

            hop.setup({
                multi_windows = true,
            })

        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        event = "VeryLazy",
        config = function ()
            local status_ok, colorizer = pcall(require, 'colorizer')
            if not status_ok then
              return
            end

            colorizer.setup()

        end
    },

    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
    },

    {
        'tpope/vim-surround',
        event = "VeryLazy",
    },
}
