return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			run_in_floaterm = true,
			floaterm = {
				position = "center",
				width = 0.45,
				height = 0.98,
			},
			-- Go keymaps
			vim.keymap.set("n", "<leader>gos", ":GoFillStruct<CR>", { desc = "Go Fill Struct" }),
			vim.keymap.set("n", "<leader>goie", ":GoIfErr<CR>", { desc = "Go If Err" }),
			vim.keymap.set("n", "<leader>goc", ":GoCheat<CR>", { desc = "Go Cheat" }),
			vim.keymap.set("n", "<leader>gota", ":GoAddTag<CR>", { desc = "Go Add Tags" }),
            vim.keymap.set("n", "<leader>gott", ":GoAddTag ", { desc = "Go Add Custom Tags" }),
			vim.keymap.set("n", "<leader>gotr", ":GoRmTag<CR>", { desc = "Go Remove Tags" }),
			vim.keymap.set("n", "<leader>gotc", ":GoClearTag<CR>", { desc = "Go Clear Tags" }),
			vim.keymap.set("n", "<leader>gotc", ":GoClearTag<CR>", { desc = "Go Clear Tags" }),
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
