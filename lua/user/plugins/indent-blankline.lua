return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = "VeryLazy",
    config = function()
        local status_ok, indent_blankline = pcall(require, 'indent_blankline')
        if not status_ok then
            return
        end

        indent_blankline.setup {
            show_current_context = true,
            show_current_context_start = true,
        }
    end
}
