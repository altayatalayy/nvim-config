return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        cmd = "Mason",
        config = function ()
            local mason_status_ok, mason = pcall(require, "mason")
            if not mason_status_ok then
                return
            end

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        lazy = true,
        config = function()

            local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
            if not mason_lspconfig_status_ok then
                return
            end
            local servers = require('user.plugins.lsp.servers')

            vim.list_extend(servers, { 'jdtls' })

            mason_lspconfig.setup({ ensure_installed = servers })
        end
    },
    -- language specific plugins
    {
        'mfussenegger/nvim-jdtls',
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        ft = { 'java' },
        config = function ()
            require('jdtls').start_or_attach(require('user.plugins.lsp.server-settings.jdtls'))
        end

    },
    --[[
    {
        "folke/neoconf.nvim",
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            --require("neoconf").setup()
        end
    },
    {
        "folke/neodev.nvim",
        dependencies = {
            "folke/neoconf.nvim"
        },
        --ft = { 'lua' },
        config = function()
            local neodev_status, neodev = pcall(require, "neodev")
            if (not neodev_status) then return end
            --neodev.setup()
        end
    },
    ]]--
    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        ft = {'rust'},
    },
    'pearofducks/ansible-vim', -- Detect Ansible files
    {
        "folke/trouble.nvim",
        lazy = true,
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            local status_ok, trouble = pcall(require,"trouble")
            if not status_ok then return end

            trouble.setup()
        end
    },

    {
        'j-hui/fidget.nvim',
        lazy = true,
        config = function()
            local status_ok, fidget = pcall(require, "fidget")
            if not status_ok then return end
            fidget.setup {}
        end,
    }, -- UI for nvim-lsp progress

    {
        "glepnir/lspsaga.nvim",
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local saga_status, saga = pcall(require, "lspsaga")
            if (not saga_status) then return end
            saga.setup({})
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/neoconf.nvim",
            "folke/neodev.nvim",
            "glepnir/lspsaga.nvim",
            'hrsh7th/nvim-cmp',
            "folke/trouble.nvim",
            'j-hui/fidget.nvim',
        },
        event = "VeryLazy",
        --event = "BufReadPost",
        config = function()
            local status_ok, lspconfig = pcall(require, 'lspconfig')
            if not status_ok then
                return
            end

            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                local status_ok, keymaps = pcall(require, 'user.plugins.lsp.keymaps.base')
                if status_ok then
                    keymaps(bufnr)
                end

                local status_ok, keymaps = pcall(require, 'user.plugins.lsp.keymaps.' .. client.name)
                if status_ok then
                    keymaps(bufnr)
                end
            end

            -- LSP diagnostics options
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = false,
                    underline = true,
                    signs = true,
                }
            )

            vim.diagnostic.config({
                virtual_text = false,
            })

            vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
            --vim.cmd [[autocmd CursorHold,CursorHoldI * Lspsaga show_line_diagnostics]]

            -- Add additional capabilities supported by nvim-cmp
            --local capabilities = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- folding (ufo) settings
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }

            local servers = require('user.plugins.lsp.servers')
            --print(vim.inspect(servers))

            for _, lsp in ipairs(servers) do
                local server_config = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }

                local status, config = pcall(require, 'user.plugins.lsp.server-settings' .. lsp)
                if status then
                    for k, v in pairs(config) do server_config[k] = v end
                end

                lspconfig[lsp].setup(server_config)
            end

            --require('user.plugins.lsp.null-ls')

        end
    },

}
