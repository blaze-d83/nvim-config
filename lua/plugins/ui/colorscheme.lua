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

	-- Rose Pine theme
	["rose-pine"] = {
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	["okai"] = {
		"okaihe/okai",
		lazy = false,
		priority = 1000,
		config = function()
			require("okai").setup({})
			vim.cmd([[colorscheme okai]])
		end,
	},

}

-- Define the variable to hold the selected theme
local selected_theme = "okai"

-- Return the table
return themes[selected_theme]
