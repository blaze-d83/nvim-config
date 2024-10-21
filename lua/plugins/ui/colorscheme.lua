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

	["darkrose"] = {
		"water-sucks/darkrose.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("darkrose")
		end,
	},

	["lackluster"] = {
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("lackluster")
		end,
	},

	["blue-moon"] = {
		"kyazdani42/blue-moon",
		config = function()
			vim.opt.termguicolors = true
			vim.cmd("colorscheme blue-moon")
		end,
	},

	["deviuspro"] = {
		"DeviusVim/deviuspro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("deviuspro")
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
}

-- Define the variable to hold the selected theme
local selected_theme = "rose-pine"

-- Return the table
return themes[selected_theme]
