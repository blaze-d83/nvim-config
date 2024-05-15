return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
		require("nvim-web-devicons").setup()
		require("nvim-web-devicons").has_loaded()
		vim.g.nvim_web_devicons_debug = true
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
