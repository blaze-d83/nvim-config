# Neovim Config

```sql
~\AppData\Local\nvim
├── lua
│   ├── plugins
│   │   ├── editor
│   │   │   ├── lang-specific
│   │   │   │   └── go.lua                 # Go language-specific settings
│   │   │   ├── auto-cmp.lua               # Autocompletion configuration
│   │   │   ├── auto-format.lua            # Auto-formatting setup
│   │   │   ├── lsp-config.lua             # LSP configurations
│   │   │   ├── mini.lua                   # Minimal Neovim plugin setup
│   │   │   ├── treesitter.lua             # Tree-sitter configuration
│   │   └── undotree.lua                   # Undotree plugin configuration
│   │   ├── nav
│   │   │   ├── neotree.lua                # Neo-tree for file navigation
│   │   └── telescope.lua                  # Telescope setup for fuzzy finding
│   │   ├── obsidian
│   │   └── obsidian.lua                   # Obsidian integration for note-taking
│   │   ├── ui
│   │   │   ├── blankline.lua              # Indent blankline configuration
│   │   │   ├── bufferline.lua             # Bufferline configuration for tabs
│   │   │   ├── colorscheme.lua            # Colorscheme settings
│   │   │   ├── dashboard.lua              # Dashboard setup
│   │   └── lualine.lua                    # Status line configuration (lualine)
│   ├── utils
│   │   ├── debugger.lua                   # Debugger utility setup
│   │   ├── dotenv.lua                     # Dotenv file management
│   │   ├── gitsigns.lua                   # Git signs integration
│   └── toggleterm.lua                     # Toggle terminal configuration
├── scripts
│   ├── defaults.lua                       # Default settings for Neovim
│   └── keymaps.lua                        # Custom key mappings
├── .env                                   # Environment variables (ignored by Git)
├── .gitignore                             # Ignore unnecessary files
├── .luarc.json                            # Lua-specific settings for the project
├── init.lua                               # Main entry point for Neovim config
├── lazy-lock.json                         # Plugin lockfile for Lazy.nvim
└── README.md                              # This file

```
