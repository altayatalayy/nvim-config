return {
    -- Dap
    {
        'rcarriga/nvim-dap-ui',
        lazy = true,
        config = function ()
            local dap_status_ok, dap = pcall(require, 'dap')
            if not dap_status_ok then
                return
            end

            local dapui_status_ok, dapui = pcall(require, 'dapui')
            if not dapui_status_ok then
                return
            end

            vim.keymap.set('n', '<leader>dt', function () dapui.toggle() end, { desc = 'toggle ui' })

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            --[[
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end
            ]]
            --
        end
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-treesitter/nvim-treesitter',
        },
        ft = {"python"},
        config = function ()
            require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        lazy = true,
        config = function ()
            require("nvim-dap-virtual-text").setup()
        end
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        },
        --cmd = "BufReadPost",
        keys = {
            {'<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'toggle_breakpoint' },
            {'<leader>dB', function () require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Condtional Break Point' },
            {'<leader>dl', function () require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = 'log msg' },
            {'<leader>dr', function () require('dap').repl.open() end, desc = 'REPL' },
            {'<leader>dc', function () require('dap').continue() end, desc = 'continue' },
            {'<leader>do', function () require('dap').step_over() end, desc = 'step_over' },
            {'<leader>di', function () require('dap').step_into() end, desc = 'step_into' },
            {'<leader>du', function () require('dap').step_out() end, desc = 'step_out' },
        },
        config = function ()
            local dap_status_ok, dap = pcall(require, 'dap')
            if not dap_status_ok then
                return
            end

            -- Register Dap keymaps
            --vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = 'toggle_breakpoint' })
            --vim.keymap.set('n', '<leader>dB', function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Condtional Break Point' })
            --vim.keymap.set('n', '<leader>dl', function () dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = 'log msg' })
            --vim.keymap.set('n', '<leader>dr', function () dap.repl.open() end, { desc = 'REPL' })
            --vim.keymap.set('n', '<leader>dc', function () dap.continue() end, { desc = 'continue' })
            --vim.keymap.set('n', '<leader>do', function () dap.step_over() end, { desc = 'step_over' })
            --vim.keymap.set('n', '<leader>di', function () dap.step_into() end, { desc = 'step_into' })
            --vim.keymap.set('n', '<leader>du', function () dap.step_out() end, { desc = 'step_out' })

            dap.adapters.codelldb = {
                type = 'server',
                port = 13000,
                executable = {
                    command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/codelldb',
                    args = { "--port", 13000 },
                }
            }

            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = true,
                },
            }

            dap.configurations.cpp = dap.configurations.c
        end
    }
}
