-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Highlight text on yank
vim.api.nvim_create_autocmd("textyankpost", {
    desc = "highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Navigation
vim.keymap.set("n", "<C-n>", "<C-d>zz")
vim.keymap.set("n", "<C-p>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Copy / Cut to Clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank current line to clipboard" })
vim.keymap.set("v", "<leader>Y", '"+Y', { desc = "Yank current line to clipboard" })

-- Replace
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move UP" })

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

-- Bufferline
vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { desc = "Buffer Line Pick" })
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { desc = "Buffer Line Pick Close" })
vim.keymap.set("n", "<leader>bx", ":BufferLineCloseOthers<CR>", { desc = "Buffer Close Others" })

local function clear_lsp_log()
    local log_file = vim.fn.expand("~/.local/state/nvim/lsp.log")
    if vim.loop.fs_stat(log_file) then
        local ok, err = os.remove(log_file)
        if ok then
            vim.api.nvim_echo({ { "LSP log file removed successfully!", "Normal" } }, false, {})
        else
            vim.api.nvim_echo({ { "Failed to remove LSP log file: " .. (err or "unknown error"), "ErrorMsg" } }, false,
                {})
        end
    else
        vim.api.nvim_echo({ { "LSP log file does not exist.", "ErrorMsg" } }, false, {})
    end
end

vim.keymap.set("n", "<leader>cl", clear_lsp_log, { noremap = true, silent = true, desc = "Clear LSP Logs" })

return {}
