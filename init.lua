vim.o.number = true
vim.o.relativenumber = true
vim.o.errorbells = false
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.mouse = "a"
vim.o.encoding = "UTF-8"
vim.o.splitbelow = true
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes:1"
vim.o.cmdheight = 2
vim.o.numberwidth = 5
vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.fileformats = "unix,dos,mac"

vim.g.mapleader = " "
vim.g.airline_powerline_fonts = 1

require('colors.cmp_hi')

vim.g.camelcasemotion_key = ','

-- --------- Colors & Appearance -----------
-- -----------------------------------------
  
  
-- Key mapping
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "H", "0", {noremap = true})
vim.api.nvim_set_keymap("n", "L", "$", {noremap = true})
vim.api.nvim_set_keymap("x", "H", "^", {noremap = true})
vim.api.nvim_set_keymap("x", "L", "$", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>vv", ":Vex!<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-a>", "<C-^>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-w>s", "<C-w>v", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-w>v", "<C-w>s", {noremap = true})
vim.api.nvim_set_keymap("n", "<tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<s-tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w><", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>>", {noremap = true})
vim.api.nvim_command("autocmd VimEnter * nnoremap <C-Down> <C-w>+")
vim.api.nvim_command("autocmd VimEnter * nnoremap <C-Up> <C-w>-")
vim.api.nvim_set_keymap("n", "<esc>", ":noh<CR>", {noremap = true})
vim.api.nvim_set_keymap("x", "p", "P", {})
vim.api.nvim_set_keymap("x", "<leader>d", "_d", {})
vim.api.nvim_set_keymap("x", "<C-c>", '"+y', {})
vim.api.nvim_set_keymap("x", ">", ">gv", {})
vim.api.nvim_set_keymap("x", "<", "<gv", {})
vim.api.nvim_set_keymap("n", "<leader>md", ":MarkdownPreview<CR>", {noremap = true})
vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", {})
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", {})

-- UltiSnips
vim.cmd("autocmd FileType dart UltiSnipsAddFiletypes dart-flutter")
vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsEditSplit = "vertical"

vim.cmd([[
  augroup auto_scrolloff
    autocmd!
    autocmd VimEnter,VimResized * let &scrolloff = winheight(0) / 4
  augroup END
]])

vim.cmd([[
  augroup quickfix_mapping
    autocmd!
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  augroup END
]])

-- --------- Others  ------------------
-- go to last loc when opening a buffer

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ------------------------------------------ 
  

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  performance = {
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = false, -- reset the runtime path to $VIMRUNTIME and your config directory(why the f you doing that)
    },
  },
})

