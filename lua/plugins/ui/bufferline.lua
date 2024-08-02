return {
	"akinsho/bufferline.nvim",
	version  = "*",
	requires = { "nvim-tree/nvim-web-devicons" },
	config   = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "buffers",
				offsets = {
					filetype  = "Neotree",
					text      = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		})
	end,
}
