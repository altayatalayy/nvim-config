return {
    "tpope/vim-surround",
    {
        "tpope/vim-dadbod",
        event = "VeryLazy",
        dependencies = {
            'kristijanhusak/vim-dadbod-ui',
            'kristijanhusak/vim-dadbod-completion',
        },
        config = function()
            local a = function()
                local M = {}

                local function db_completion()
                    require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
                end

                function M.setup()
                    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

                    vim.api.nvim_create_autocmd("FileType", {
                        pattern = {
                            "sql",
                        },
                        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
                    })

                    vim.api.nvim_create_autocmd("FileType", {
                        pattern = {
                            "sql",
                            "mysql",
                            "plsql",
                        },
                        callback = function()
                            vim.schedule(db_completion)
                        end,
                    })
                end

                return M
            end

            a().setup()
        end
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
        end,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("git-worktree").setup()
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<leader>ha", function()
                mark.add_file()
            end, { desc = "harpoon add file" })
            vim.keymap.set("n", "<leader>hr", function()
                mark.rm_file()
            end, { desc = "harpoon rm file" })
        end,
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndotreeToggle" },
        },
        config = function()
            --vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle"})
        end,
    },

    "gpanders/editorconfig.nvim",
    --[[ 'luk400/vim-jukit', ]]

    {
        "rcarriga/nvim-notify",
        config = function()
            local status_ok, notify = pcall(require, "notify")
            if not status_ok then
                return
            end

            vim.notify = function(msg, ...)
                if msg:match("warning: multiple different client offset_encodings") then
                    return
                end
                notify(msg, ...)
            end
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = false,      -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        config = function()
            local status_ok, icons = pcall(require, "nvim-web-devicons")
            if not status_ok then
                return
            end

            icons.setup({
                override = {},
                default = true,
            })
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            local status_ok, gitsigns = pcall(require, "gitsigns")
            if not status_ok then
                return
            end

            gitsigns.setup({
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 300,
                    ignore_whitespace = false,
                },
            })
        end,
    },

    {
        "RRethy/vim-illuminate", -- highlighting other uses of the word under the cursor
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        event = "VeryLazy",
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            local status_ok, colorizer = pcall(require, "colorizer")
            if not status_ok then
                return
            end

            colorizer.setup()
        end,
    },
}
