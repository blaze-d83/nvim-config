return {
	"nvim-treesitter/nvim-treesitter",
	build        = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"c",
			"cpp",
			"rust",
			"css",
			"html",
			"typescript",
            "go",
		},
		auto_install = true,
		highlight    = { enable = true },
		indent       = { enable = true },
		textobjects  = {
			select = {
				enable    = true,
				lookahead = true,
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
