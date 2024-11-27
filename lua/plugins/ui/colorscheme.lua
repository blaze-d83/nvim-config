-- Define configurations for themes
local themes = {

    -- Tokyonight theme
    ["tokyonight"] = {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd("colorscheme tokyonight-moon")
        end,
    },

    -- Melliflous theme
    ["melliflous"] = {
        "ramojus/mellifluous.nvim",
        -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
        config = function()
            require("mellifluous").setup({}) -- optional, see configuration section.
            vim.cmd("colorscheme mellifluous")
        end,
    },

    -- Rose Pine theme
    ["rose-pine"] = {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({})
            vim.cmd("colorscheme rose-pine")
        end,
    },

    -- Okai theme
    ["okai"] = {
        "okaihe/okai",
        lazy = false,
        priority = 1000,
        config = function()
            require("okai").setup({})
            vim.cmd([[colorscheme okai]])
        end,
    },

    -- Darkrose theme
    ["darkrose"] = {
        "water-sucks/darkrose.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("darkrose")
        end,
    },

    -- Lackluster theme
    ["lackluster"] = {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("lackluster")
        end,
    },

    ["catppuccin"] = {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({})
            vim.cmd([[colorscheme catppuccin]])
        end,
    },

    -- No Clown Fiesta theme
    ["no-clown-fiesta"] = {
        "aktersnurra/no-clown-fiesta.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme no-clown-fiesta")
        end,
    },

    -- Kanagawa theme
    ["kanagawa"] = {
        "rebelot/kanagawa.nvim",
        -- Default options:
        config = function()
            require('kanagawa').setup({
                compile = false,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,   -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {             -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",    -- Load "wave" theme when 'background' option is not set
                background = {     -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus"
                },
            })
            -- setup must be called before loading
            vim.cmd("colorscheme kanagawa")
        end,
    },

    --    Zen Bones theme
    ["zenbones"] = {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.zenbones_darken_comments = 45
            vim.cmd.colorscheme('zenbones')
        end

    },
}

-- Define the variable to hold the selected theme
local selected_theme = "kanagawa"

-- If no theme is selected (i.e., `selected_theme` is empty or "default"), use the default colorscheme
if selected_theme == "" or selected_theme == "default" then
    vim.cmd.colorscheme("default")
    return {}
else
    -- Otherwise, return the selected theme's config from the `themes` table
    return themes[selected_theme]
end
