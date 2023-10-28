return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = false })
            ts_update()
        end,
        event = 'VeryLazy',
        config = function()
            local status_ok, treesitter = pcall(require, 'nvim-treesitter')
            if not status_ok then
                return
            end

            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    'python',
                    'lua',
                    'julia',
                    'c',
                    'cpp',
                    'c_sharp',
                    'cmake',
                    'ninja',
                    'llvm',
                    'cuda',
                    'glsl',
                    'gdscript',
                    'rust',
                    'java',
                    'kotlin',
                    'scala',
                    'javascript',
                    'typescript',
                    'html',
                    'http',
                    'json',
                    'jsonc',
                    'json5',
                    'css',
                    'vue',
                    'dart',
                    'go',
                    'gomod',
                    'gowork',
                    'make',
                    'regex',
                    'vim',
                    'yaml',
                    'toml',
                    'rst',
                    'markdown',
                    'dockerfile',
                    'bash',
                    'fish',
                    'comment',
                    'norg',
                    'astro',
                    'haskell',
                    'sql',
                },

                -- Install languages synchronously (only applied to `ensure_installed`)
                sync_install = false,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },

                -- Enable ts-autotag
                --[[ autotag = {
                    enable = true,
                }, ]]
            }
            --[[ require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            -- You can optionally set descriptions to the mappings (used in the desc parameter of
                            -- nvim_buf_set_keymap) which plugins like which-key display
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = true,
                    },
                },
            } ]]
        end
    },

    {
        'm-demare/hlargs.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = "VeryLazy",
        config = function()
            local status_ok, treesitter = pcall(require, 'nvim-treesitter')
            if not status_ok then return end
            local status_ok, hlargs = pcall(require, 'hlargs')
            if not status_ok then return end
            hlargs.setup()
        end,
    },


    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = "VeryLazy",
        config = function ()
            require('ts_context_commentstring').setup {}
        end
    },

    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            local status_ok, autopairs = pcall(require, "nvim-autopairs")
            if not status_ok then return end
            -- autopairs.setup {}
        end
    },

    --[[ {
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = "VeryLazy",
    }, ]]
}
