vim.g.mapleader = " "
vim.wo.number = true
vim.bo.autoindent = false
vim.g.have_nerd_font = true
vim.opt.inccommand = "split"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.o.swapfile = false

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Windows commands
vim.keymap.set("n", "<C-h>", "<C-w><C-j>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-k>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-l>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-h>", { desc = "Move focus to the upper window" })
