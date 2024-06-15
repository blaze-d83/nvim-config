vim.g.mapleader       = " "
vim.g.have_nerd_font  = true
vim.bo.autoindent     = false
vim.o.swapfile        = false
vim.wo.number         = true
vim.wo.cursorline     = true

vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.inccommand     = "split"
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.smartindent    = true
vim.opt.scrolloff      = 10
vim.opt.termguicolors  = true

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", {desc = "Save"})

-- Highlight text on yank
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Copy / Cut to Clipboard 
vim.keymap.set("n", "<leader>y", "\"+y", {desc = "Yank to clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "Yank to clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Yank current line to clipboard"})

-- Replace
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move Down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move UP"})

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Windows commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
