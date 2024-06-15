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
                    return vim.fn.input({
                        prompt     = "Path to executable: ",
                        default    = vim.fn.getcwd() .. "\\target\\debug\\",
                        completion = "file"
                    })
				end,
				cwd           = "${workspaceFolder}",
				stopOnEntry   = false,
				args          = {},
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

		-- DAP keymaps
		vim.keymap.set("n", "<leader>db", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })

		vim.keymap.set("n", "<leader>dc", function()
			require("dap").continue()
		end, { desc = "Continue" })

		vim.keymap.set("n", "<leader>dso", function()
			require("dap").step_over()
		end, { desc = "Step Over" })

		vim.keymap.set("n", "<leader>dsi", function()
			require("dap").step_into()
		end, { desc = "Step Into" })

		vim.keymap.set("n", "<leader>dsx", function()
			require("dap").step_out()
		end, { desc = "Step Out" })

		vim.keymap.set("n", "<leader>dr", function()
			require("dap").repl.open()
		end, { desc = "Open REPL" })

		vim.keymap.set("n", "<leader>dl", function()
			require("dap").run_last()
		end, { desc = "Run Last" })

		vim.keymap.set("n", "<leader>dt", function()
			require("dap-go").debug_test()
		end, { desc = "Debug Test" })

		vim.keymap.set({ "n", "v" }, "<leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Hover" })

		vim.keymap.set({ "n", "v" }, "<leader>dp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "Preview" })

		vim.keymap.set("n", "<leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end, { desc = "Frames" })

		vim.keymap.set("n", "<leader>dw", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, { desc = "Scopes" })

	end,
}
