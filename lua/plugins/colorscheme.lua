-- Define configurations for themes
local themes = {
	-- Tokyonight theme
	["tokyonight"] = {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme tokyonight-moon")
		end,
	},

	-- Rose Pine theme
	["rose-pine"] = {
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Catppuccin theme
	["catppuccin"] = {
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
				color_overrides = {
					latte = {
						base = "#f9f5d7",
						rosewater = "#c38c84", -- Dusty rose
						flamingo = "#c38c84", -- Dusty rose
						red = "#a8554b", -- Deep terracotta
						maroon = "#a8554b", -- Deep terracotta
						pink = "#d3869b", -- Dusty mauve
						mauve = "#d3869b", -- Dusty mauve
						peach = "#e78a4e", -- Warm peach
						yellow = "#d8a657", -- Earthy yellow
						green = "#a9b665", -- Olive green
						teal = "#89b482", -- Desert teal
						sky = "#89b482", -- Desert teal
						sapphire = "#89b482", -- Desert teal
						blue = "#7daea3", -- Dusty blue
						lavender = "#7daea3", -- Dusty blue
						text = "#654735", -- Dark brown text
						subtext1 = "#73503c", -- Slightly lighter brown
						subtext0 = "#805942", -- Lighter brown
						overlay2 = "#8c6249", -- Light brown
						overlay1 = "#8c856d", -- Medium brown
						overlay0 = "#a69d81", -- Light brown
						surface2 = "#bfb695", -- Light beige
						surface1 = "#d1c7a3", -- Beige
						surface0 = "#e3dec3", -- Very light beige
						mantle = "#f0ebce",
						crust = "#e8e3c8",
					},
					mocha = {
						base = "#1d2021",
						mantle = "#191b1c",
						crust = "#141617",
						rosewater = "#c38c84", -- Dusty rose
						flamingo = "#c38c84", -- Dusty rose
						red = "#a8554b", -- Deep terracotta
						maroon = "#a8554b", -- Deep terracotta
						pink = "#d3869b", -- Dusty mauve
						mauve = "#d3869b", -- Dusty mauve
						peach = "#e78a4e", -- Warm peach
						yellow = "#d8a657", -- Earthy yellow
						green = "#a9b665", -- Olive green
						teal = "#89b482", -- Desert teal
						sky = "#89b482", -- Desert teal
						sapphire = "#89b482", -- Desert teal
						blue = "#7daea3", -- Dusty blue
						lavender = "#7daea3", -- Dusty blue
						text = "#654735", -- Dark brown text
						subtext1 = "#73503c", -- Slightly lighter brown
						subtext0 = "#805942", -- Lighter brown
						overlay2 = "#8c6249", -- Light brown
						overlay1 = "#8c856d", -- Medium brown
						overlay0 = "#a69d81", -- Light brown
						surface2 = "#bfb695", -- Light beige
						surface1 = "#d1c7a3", -- Beige
						surface0 = "#e3dec3", -- Very light beige
					},
				},
				transparent_background = true,
				show_end_of_buffer = false,
				integration_default = false,
				integrations = {
					barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
					cmp = true,
					gitsigns = true,
					hop = true,
					illuminate = { enabled = true },
					native_lsp = { enabled = true, inlay_hints = { background = true } },
					neogit = true,
					neotree = true,
					semantic_tokens = true,
					treesitter = true,
					telescope = true,
					treesitter_context = true,
					vimwiki = true,
					which_key = true,
				},
				highlight_overrides = {
					all = function(colors)
						return {
							-- Your highlight overrides here
							-- Normal mode cursor
							Cursor = { bg = colors.blue },
							-- Visual mode cursor
							Visual = { bg = colors.blue },
							-- Search highlighting
							Search = { bg = colors.overlay0, fg = colors.text },
							-- Current line
							CursorLine = { bg = colors.surface1 },
							-- Current column
							CursorColumn = { bg = colors.surface1 },
							-- Line number in NERDTree
							SignColumn = { bg = "NONE" },
							-- Folded lines
							Folded = { bg = colors.mantle, fg = colors.text },
							-- Fold column
							FoldColumn = { bg = "NONE", fg = colors.text },
							-- Diff text
							DiffAdd = { bg = "NONE", fg = colors.green },
							DiffChange = { bg = "NONE", fg = colors.yellow },
							DiffDelete = { bg = "NONE", fg = colors.red },
							-- Error messages
							ErrorMsg = { bg = "NONE", fg = colors.red },
							-- Mode text (e.g., -- INSERT --)
							ModeMsg = { bg = "NONE", fg = colors.text },
							-- Terminal text
							Terminal = { bg = colors.surface0, fg = colors.subtext0 },
							-- Warning messages
							WarningMsg = { bg = "NONE", fg = colors.yellow },
							-- Line breakpoints
							Breakpoint = { bg = "NONE", fg = colors.red },
							-- Breakpoint pending
							BreakpointPending = { bg = "NONE", fg = colors.yellow },
							-- Breakpoint enabled
							BreakpointEnabled = { bg = "NONE", fg = colors.green },
						}
					end,
					latte = function(colors)
						return {
							-- Your highlight overrides specific to the latte palette here
						}
					end,
					mocha = function(colors)
						return {
							-- Your highlight overrides specific to the mocha palette here
						}
					end,
				},
			})

			vim.cmd("colorscheme catppuccin")
		end,
	},
}

-- Define the variable to hold the selected theme
local selected_theme = "rose-pine"

-- Return the table
return themes[selected_theme]
