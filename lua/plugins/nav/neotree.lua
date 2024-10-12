return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    -- Lazy load the plugin when the <leader>e key is pressed or when the command is executed
    keys = {
        { "<leader>e", "<cmd>Neotree filesystem reveal float<CR>", desc = "Open NeoTree" },
    },
    cmd = { "Neotree" },  -- This will load neo-tree when you use the :Neotree command
    config = function()
        require("nvim-web-devicons").setup()  -- Setup icons
        require("nvim-web-devicons").has_loaded()
        vim.g.nvim_web_devicons_debug = true  -- Optional debug info

        -- Setup neo-tree
        require("neo-tree").setup({
            popup_border_style = "rounded",
            indent = { padding = 1.5 },
            window = {
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_hidden = false,
                    hide_by_name = {
                        "node_modules",
                    },
                    never_show = {
                        ".git",
                    },
                },
            },
        })
    end,
}

