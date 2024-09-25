return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Manage LSP Servers, DAP Servers, and formatters
		"williamboman/mason-lspconfig.nvim", -- Bridge between Mason and nvim-lspconfig
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Automatically install tools using Mason
		{ "j-hui/fidget.nvim", opts = {} }, -- Show LSP status
		{ "folke/neodev.nvim", opts = {} }, -- Better Lua dev experience
		"jose-elias-alvarez/nvim-lsp-ts-utils", -- TS/JS utilities like organizing imports
	},
	config = function()
		vim.lsp.set_log_level("debug")
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local function on_attach()
			-- Define on_attach login here
		end

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			rust_analyzer = {
				on_attach = on_attach(),
				capabilities = capabilities,
				filetype = { "rust" },
				root_dir = require("lspconfig.util").root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			},

			gopls = {
				filetypes = { "go", "gomod", "gotmpl", "gowork", },
				root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
			},

			tsserver = {
				on_attach = function(client, bufnr)
					local ts_utils = require("nvim-lsp-ts-utils")
					ts_utils.setup({})
					ts_utils.setup_client(client)
				end,
				settings = {
					eslint = {
						enable = true,
					},
				},
			},
			html = {
				filetypes = { "html", "templ" },
			},
			templ = {
				on_attach = on_attach(),
				capabilities = capabilities,
				filetypes = { "templ" },
				root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", "go.sum", ".git"),
			},
			cssls = {},
			tailwindcss = {
				filetypes = { "templ", "astro", "javascript", "typescript", "react" },
				settings = {
					tailwindCSS = {
						includeLanguages = {
							templ = "html",
						},
					},
				},
			},
			clangd = {},
			pyright = {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
						},
					},
				},
			},
			zls = {},
			jsonls = {
				filetype = { "json", "jsonc" },
				settings = {},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
