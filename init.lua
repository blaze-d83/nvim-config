-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {

		{ import = "plugins/ui" },

		{ import = "plugins/nav" },

		{ import = "plugins/editor" },

		{ import = "plugins/editor/lang-specific" },

		{ import = "plugins/utils" },

		{ import = "plugins/obsidian" },

		{ import = "scripts" },
	},

	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
})

-- Environment variables
vim.env.GOROOT = "C:\\Program Files\\Go"
vim.env.GOBIN = "C:\\Program Files\\Go\\bin"
