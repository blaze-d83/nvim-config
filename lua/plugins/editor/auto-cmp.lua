return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"rafamadriz/friendly-snippets",
		"mireq/luasnip-snippets",
	},
	config = function()
		local cmp     = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
			mapping = cmp.mapping.preset.insert({
				["<C-n>"]     = cmp.mapping.select_next_item(), -- Navigate to the next item
				["<C-p>"]     = cmp.mapping.select_prev_item(), -- Navigate to the prev item
				["<C-b>"]     = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
				["<C-f>"]     = cmp.mapping.scroll_docs(4), --  Scroll documentation down
				["<C-y>"]     = cmp.mapping.confirm({ select = true }), -- Confirm selection
				["<C-Space>"] = cmp.mapping.complete({}), -- Trigger completion menu
				["<C-l>"]     = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }), -- Jump forware in next snippet
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }), -- Jump backward in snippet
			}),
			sources = {
				{ name = "nvim_lsp" }, -- LSP based autocompletion
				{ name = "luasnip" }, -- Snippet-based autocompletion
				{ name = "path" }, -- Path based autocompletion
			},
		})
	end,
}

