return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    main = "ibl",
    event = "VeryLazy",
    config = function()
        local status_ok, ibl = pcall(require, 'ibl')
        if not status_ok then
            return
        end

        ibl.setup()
    end
}
