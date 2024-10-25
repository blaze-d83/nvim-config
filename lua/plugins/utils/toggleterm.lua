local shell = vim.fn.executable("bash") == 1 and "bash" or vim.o.shell
local plugin = {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                size            = 20,
                open_mapping    = [[<C-\>]],
                hide_numbers    = true,
                shade_filetypes = {},
                shade_terminals = false,
                start_in_insert = true,
                insert_mappings = true,
                persist_size    = true,
                direction       = "horizontal",
                shell           = shell,
                auto_scroll     = true,
                border          = "horizontal",
            })
        end,
    },
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
    vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", opts)
    vim.api.nvim_set_keymap("t", "<C-h>", "<Cmd>wincmd h<CR>", opts)
    vim.api.nvim_set_keymap("t", "<C-j>", "<Cmd>wincmd j<CR>", opts)
    vim.api.nvim_set_keymap("t", "<C-k>", "<Cmd>wincmd k<CR>", opts)
    vim.api.nvim_set_keymap("t", "<C-l>", "<Cmd>wincmd l<CR>", opts)
    vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
end

-- Set up autocommand for TermOpen event to set keymaps when a terminal is opened
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

return plugin
