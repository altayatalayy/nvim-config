local M = {}

function M.check()
	vim.health.start("LazyVim")

	if vim.fn.has("nvim-0.8.0") == 1 then
		vim.health.ok("Using Neovim >= 0.8.0")
	else
		vim.health.warn("Neovim >= 0.8.0 is required")
		vim.health.error("Neovim >= 0.8.0 is required")
	end
end

return M
