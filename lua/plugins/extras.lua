return {

-- Mini.nvim
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.align").setup()
			require("mini.bracketed").setup()
			require("mini.clue").setup()
			require("mini.comment").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},

-- Undo tree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

-- Indent Blank Line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

-- Lua Line
	{

		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
				},
			})
		end,
	},

-- Which Key
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()
			vim.keymap.set("n", "<leader>W", ":WhichKey<CR>", {})
		end,
	},
}
