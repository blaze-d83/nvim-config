return {
	{
		"folke/which-key.nvim",
		event  = "VimEnter",
		config = function()
			require("which-key").setup()
			vim.keymap.set("n", "<leader>W", ":WhichKey<CR>", {})
		end,
	},
}
