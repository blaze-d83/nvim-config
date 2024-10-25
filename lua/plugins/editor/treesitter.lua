return {
	"nvim-treesitter/nvim-treesitter",
	build        = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        'vrischmann/tree-sitter-templ',
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
            "zig",
            "templ",
		},
		auto_install = true,
		highlight    = { enable = true, addtional_vim_regex_highlighting = false, },
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
        require("ibl").setup({
            scope = {
                enabled = false,
            }
        })
        require("nvim-ts-autotag").setup({
            opts = {}
        })
	end,
}
