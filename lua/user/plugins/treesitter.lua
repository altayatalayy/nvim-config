return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = false })
            ts_update()
        end,
        event = 'VeryLazy',
        config = function ()
            local status_ok, treesitter = pcall(require, 'nvim-treesitter')
            if not status_ok then
                return
            end

            require'nvim-treesitter.configs'.setup {
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
                  'help',
                  'astro',
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
              autotag = {
                enable = true,
              },
            }
            
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
    },

    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            local status_ok, autopairs = pcall(require, "nvim-autopairs")
            if not status_ok then return end
            autopairs.setup {}
        end
    },

    {
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = "VeryLazy",
    },
}
