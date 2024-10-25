return { -- Fuzzy Finder
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {                   -- If encountering errors, see telescope-fzf-native README for installation instructions
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make", -- This is only run then, not every time Neovim starts up.
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        -- Useful for getting pretty icons, but requires a Nerd Font.
        { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
    keys = {
        { "<leader>sh",  "<cmd>lua require('telescope.builtin').help_tags()<CR>",       desc = "[S]earch [H]elp" },
        { "<leader>sk",  "<cmd>lua require('telescope.builtin').keymaps()<CR>",         desc = "[S]earch [K]eymaps" },
        { "<leader>sf",  "<cmd>lua require('telescope.builtin').find_files()<CR>",      desc = "[S]earch [F]iles" },
        { "<leader>ss",  "<cmd>lua require('telescope.builtin').builtin()<CR>",         desc = "[S]earch [S]elect Telescope" },
        { "<leader>st",  "<cmd>lua require('telescope.builtin').git_files()<CR>",       desc = "[S]earch [G]it Files" },
        { "<leader>slr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>",  desc = "[] Lsp References" },
        { "<leader>sld", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", desc = "[] Lsp Definitions" },
        { "<leader>sw",  "<cmd>lua require('telescope.builtin').grep_string()<CR>",     desc = "[S]earch current [W]ord" },
        { "<leader>sg",  "<cmd>lua require('telescope.builtin').live_grep()<CR>",       desc = "[S]earch by [G]rep" },
        { "<leader>sd",  "<cmd>lua require('telescope.builtin').diagnostics()<CR>",     desc = "[S]earch [D]iagnostics" },
        { "<leader>sr",  "<cmd>lua require('telescope.builtin').resume()<CR>",          desc = "[S]earch [R]esume" },
        {
            "<leader>s.",
            "<cmd>lua require('telescope.builtin').oldfiles()<CR>",
            desc = '[S]earch Recent Files ("." for repeat)',
        },
        {
            "<leader><leader>",
            "<cmd>lua require('telescope.builtin').buffers()<CR>",
            desc = "[ ] Find existing buffers",
        },
        { "<leader>sq", "<cmd>lua require('telescope.builtin').quickfix()<CR>", desc = "[] Quick Fix" },
        {
            "<leader>/",
            function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end,
            { desc = "[/] Fuzzily search in current buffer" },
        },
        {
            "<leader>s/",
            function()
                require("telescope.builtin").live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end,
            { desc = "[S]earch [/] in Open Files" },
        },
        {
            "<leader>sn",
            function()
                require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
            end,
            { desc = "[S]earch [N]eovim files" },
        },
    },
    cmd = { "Telescope" }, -- This will load telescope when you use the :Telescope command
    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "flex",
                layout_config = {
                    horizontal = { preview_cutoff = 80, preview_width = 0.55 },
                    vertical = { mirror = true, preview_cutoff = 25 },
                    prompt_position = "top",
                    width = 0.87,
                    height = 0.80,
                },
                file_ignore_patterns = {
                    "node_modules",
                    "%_files/",
                    "%_cache",
                    ".git/",
                    ".site_libs",
                    ".venv",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
            },
            extensions = {
                ["fzf"] = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
    end,
}
