local ensure_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Autocmd that runs PackerSync whenever you save plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = "rounded" }
        end
    }
}

packer.reset()

local setup = function()
    vim.cmd("colorscheme tokyonight-night")
    vim.g.mkdp_filetypes = { "markdown" }
end


pcall(setup)

return packer.startup(function(use)
    use { 'wbthomason/packer.nvim', }

    use { 'lewis6991/impatient.nvim', }

    use { 'mbbill/undotree' }

    use { 'gpanders/editorconfig.nvim', }

    use { 'rcarriga/nvim-notify', }

    use { 'kyazdani42/nvim-web-devicons' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    use { 'folke/tokyonight.nvim', }

    use { "lukas-reineke/indent-blankline.nvim", }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = false })
            ts_update()
        end,
    }

    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function() 
            local status_ok, treesitter = pcall(require, 'nvim-treesitter')
            if not status_ok then return end
            require('hlargs').setup() end,
    }

    use { 'numToStr/Comment.nvim', }

    use { 'JoosepAlviste/nvim-ts-context-commentstring', }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    local status_ok, treesitter = pcall(require, 'nvim-treesitter')
    if status_ok then
        use {
            'windwp/nvim-ts-autotag',
            requires = { 'nvim-treesitter/nvim-treesitter' },
        }
    end


    use { 'lewis6991/gitsigns.nvim', }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use {
        'j-hui/fidget.nvim',
        config = function() 
            local status_ok, fidget = pcall(require, "fidget")
            if not status_ok then return end
            fidget.setup {}
        end,
    } -- UI for nvim-lsp progress
    use { "glepnir/lspsaga.nvim", }
    use { "williamboman/mason.nvim", }
    use { "williamboman/mason-lspconfig.nvim", }
    use { "neovim/nvim-lspconfig", }
    use { 'onsails/lspkind.nvim', }

    use { "RRethy/vim-illuminate", } -- highlighting other uses of the word under the cursor

    -- language specific plugins
    use "folke/neodev.nvim"
    use { 'mfussenegger/nvim-jdtls', }
    use { 'simrat39/rust-tools.nvim', }
    use { 'pearofducks/ansible-vim', } -- Detect Ansible files

    -- Completion
    use { 'hrsh7th/cmp-nvim-lsp', }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help', }
    use { 'hrsh7th/cmp-nvim-lua', }
    use { 'hrsh7th/cmp-buffer', }
    use { 'hrsh7th/cmp-path', }
    use { 'hrsh7th/cmp-cmdline', }
    use { 'hrsh7th/nvim-cmp', }
    use {
        "petertriho/cmp-git",
        requires = "nvim-lua/plenary.nvim",
    }
    -- Lua snip
    use { 'L3MON4D3/LuaSnip', }
    use { 'saadparwaiz1/cmp_luasnip', }
    use { "rafamadriz/friendly-snippets", }

    -- Linting
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    }
    use { "nvim-telescope/telescope-file-browser.nvim", }
    use { 'nvim-telescope/telescope-ui-select.nvim', }
    use { 'camgraff/telescope-tmux.nvim', }
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function() require('neoclip').setup() end,
    }
    use { 'nvim-telescope/telescope-media-files.nvim', }

    -- Dap
    use { 'mfussenegger/nvim-dap', }
    use { 'rcarriga/nvim-dap-ui', }
    use { 'mfussenegger/nvim-dap-python', }
    use { 'theHamsta/nvim-dap-virtual-text', }
    use { 'nvim-telescope/telescope-dap.nvim', }

    use { 'phaazon/hop.nvim', }

    use { 'norcalli/nvim-colorizer.lua', }

    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
    }
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
        end
    }

    use { 'folke/which-key.nvim', }

    use { 'tpope/vim-surround' }
    if packer_bootstrap then
        require('packer').sync()
    end

end)
