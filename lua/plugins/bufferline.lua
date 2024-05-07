return {
	"akinsho/bufferline.nvim",
	version = "*",
	requires = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "buffers",
				offsets = {
					filetype = "nvim-tree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		})
	end,
	vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>"),
}
