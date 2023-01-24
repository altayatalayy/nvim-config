--[[ local wk_status_ok, wk = pcall(require, "which-key") ]]
--[[ if not wk_status_ok then ]]
--[[     return ]]
--[[ end ]]

vim.keymap.set("n", "s", ":HopChar1<CR>", { desc = 'HopChar1' })
vim.keymap.set("n", "sw", ":HopWord<CR>", { desc = 'HopWord' })
vim.keymap.set("n", "<C-p>", "<Plug>MarkdownPreviewToggle", { desc = 'MarkdownPreviewToggle' })
vim.keymap.set("n", "<C-S>", ":%s/", { desc = '' })
-- Mappings.

--['|'] = { ':vs<CR>', 'vertical split' },
--['-'] = { ':sp<CR>', 'horizontal split' },
--t = { ':tabnew %<CR>', 'tabnew' },
--n = { ':tabnext<CR>', 'tabnext' },
--p = { ':tabprev<CR>', 'tabprev' },
--l = { '<C-W><C-L>', 'right' },
--h = { '<C-W><C-H>', 'left' },
--k = { '<C-W><C-K>', 'up' },
--j = { '<C-W><C-J>', 'down' },
--wk.register({
--    ["<Esc>"] = { "<C-\\><C-n>", '' },
--}, { mode = 't', silent = true, noremap = true, })

-- Move text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move text down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move text up' })

-- dont copy into register when pasting
vim.keymap.set('v', 'p', '"_dP')

-- stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- keep the cursor inplace when using J
vim.keymap.set("n", "J", "mzJ`z")

-- keep the cursor in the middle when scrolling with Ctrl-u Ctrl-d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix navigation
--[[
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
]] --
-- find and replace the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'replace cur word' })

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'make file exec' })
