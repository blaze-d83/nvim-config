vim.g.mapleader       = " "
vim.g.have_nerd_font  = true
vim.bo.autoindent     = false
vim.o.swapfile        = false
vim.wo.number         = true
vim.wo.cursorline     = true
vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.inccommand  = "split"
vim.opt.hlsearch    = false
vim.opt.incsearch   = true
vim.opt.smartindent = true
vim.opt.scrolloff   = 10

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", {})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc     = "Highlight when yanking (copying) text",
	group    = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,         { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next,         { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Windows commands
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", {})
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

