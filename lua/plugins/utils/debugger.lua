return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-telescope/telescope-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	-- Lazy load the plugin only when one of these commands or keybindings is triggered
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		{
			"<leader>dso",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>dsi",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>dsx",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "Open REPL",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "Run Last",
		},
		{
			"<leader>dt",
			function()
				require("dap-go").debug_test()
			end,
			desc = "Debug Test",
		},
		{
			"<leader>dh",
			mode = { "n", "v" },
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "Hover",
		},
		{
			"<leader>dp",
			mode = { "n", "v" },
			function()
				require("dap.ui.widgets").preview()
			end,
			desc = "Preview",
		},
		{
			"<leader>df",
			function()
				require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
			end,
			desc = "Frames",
		},
		{
			"<leader>dw",
			function()
				require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
			end,
			desc = "Scopes",
		},
	},
	cmd = {
		"DapToggleBreakpoint",
		"DapContinue",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapOpenRepl",
		"DapRunLast",
		"DapUIOpen",
		"DapUIClose",
		"DapToggleUI",
	},
	config = function()
		-- This part is run only when the plugin is loaded (lazy-loaded)
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")
		local dap_go = require("dap-go")
		local telescope = require("telescope")

		dapui.setup()
		dap_virtual_text.setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module>",
		})
		telescope.load_extension("dap")
		dap_go.setup()

		-- Define DAP signs (breakpoint icons)
		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

		-- Configure DAP for LLDB (Rust)
		dap.adapters.lldb = {
			type = "executable",
			command = "C:\\mingw64\\bin\\lldb-vscode.exe", -- Ensure this path is correct
			name = "lldb",
		}

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input({
						prompt = "Path to executable: ",
						default = vim.fn.getcwd() .. "\\target\\debug\\",
						completion = "file",
					})
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}

		-- Open and close DAP UI automatically
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
