require("harpoon").setup({})

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require("harpoon.term");
local function customGoTerminal()
	term.gotoTerminal(1)
	vim.fn.feedkeys('i')
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<C-h>", function() customGoTerminal() end)
