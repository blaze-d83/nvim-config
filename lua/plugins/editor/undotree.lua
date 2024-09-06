return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_DiffCommand = "C:/Program Files/Git/git-bash.exe"
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
