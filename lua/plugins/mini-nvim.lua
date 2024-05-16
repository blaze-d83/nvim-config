return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.bracketed").setup()
			require("mini.clue").setup()
			require("mini.comment").setup()
			require("mini.indentscope").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},
}
