--[[
-- Usage 
vim.api.nvim_set_keymap("n", "<leader>cao", "<cmd>lua require('caoSED').setup_substitution()<CR>", { noremap = true })

]]
--
-- (c)hange (a)ll (o)bjects - cao
--       S    E    D
-- SED Editor Hotkey

-- In a file named caoSED.lua
--Actual caoSED
local M = {}

function M.setup_substitution()
	local cmd = string.format("%%s/<C-r>a/<C-r>b/g")
	vim.api.nvim_command(cmd)
	vim.api.nvim_feedkeys("gv", "n", false)
	vim.api.nvim_feedkeys("3h", "n", false)
end

return M
