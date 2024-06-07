return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-telescope/telescope-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapgo = require("dap-go")

		dapui.setup()
		dapgo.setup()

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

		-- Setup DAP for LLDB (Rust)
		dap.adapters.lldb = {
			type = "executable",
			command = "C:\\mingw64\\bin\\lldb-vscode.exe",
			name = "lldb",
		}

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\target\\debug\\", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}

		-- Open DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_initialized["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
