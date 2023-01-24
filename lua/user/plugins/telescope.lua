return {
    -- Telescope
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        lazy = true,
    },
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
        },
        lazy = true,
        config = function()
            local status_ok, neoclip = pcall(require, 'neoclip')
            if not status_ok then return end
            neoclip.setup()
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        keys = {
            {"<leader>tf", function () vim.cmd[[ Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍 ]] end, desc = 'find files'},
            {'<leader>tr', ':Telescope file_browser<CR>', desc = 'file browser'},
            {'<leader>tl', ':Telescope live_grep<CR>', desc = 'live grep'},
            {'<leader>tk', ':Telescope keymaps<CR>', desc = 'keymaps'},
            {'<leader>td', ':Telescope diagnostics<CR>', desc = 'diagnostics'},
            {'<leader>tc', ':Telescope neoclip<CR>', desc = 'neoclip'},
        },
        cmd = "Telescope",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'rcarriga/nvim-notify',
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-telescope/telescope-dap.nvim',
            'camgraff/telescope-tmux.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            "nvim-telescope/telescope-file-browser.nvim",
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        config = function ()
            local status_ok, telescope = pcall(require, 'telescope')
            if not status_ok then
                return
            end

            telescope.setup { defaults = { file_ignore_patterns = { ".git/" } } }


            telescope.load_extension('file_browser')
            telescope.load_extension('ui-select')
            telescope.load_extension('fzf')
            telescope.load_extension('neoclip')
            telescope.load_extension('media_files')
            telescope.load_extension('dap')
            telescope.load_extension('notify')
            telescope.load_extension('tmux')
        end,
        init = function ()
            --vim.keymap.set('n', '<leader>tf', function () vim.cmd[[ Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR> ]] end, {desc = 'find files'})
            --vim.keymap.set('n', '<leader>tg', ':Telescope git_files<CR>', {desc = 'git files'})
            --vim.keymap.set('n', '<leader>tl', ':Telescope live_grep<CR>', {desc = 'live grep'})
            --vim.keymap.set('n', '<leader>tk', ':Telescope keymaps<CR>', {desc = 'keymaps'})
            --vim.keymap.set('n', '<leader>tb', ':Telescope buffers<CR>', {desc = 'buffers'})
            --vim.keymap.set('n', '<leader>tc', ':Telescope neoclip<CR>', {desc = 'neoclip'})
            --vim.keymap.set('n', '<leader>td', ':Telescope diagnostics<CR>', {desc = 'diagnostics'})
            --vim.keymap.set('n', '<leader>tm', ':lua require("telescope").extensions.macroscope.default()<CR>', {desc = 'macroscope'})
        end,
    }
}
