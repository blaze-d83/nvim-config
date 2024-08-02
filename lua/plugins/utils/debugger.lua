return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-telescope/telescope-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local dap_virtual_text = require("nvim-dap-virtual-text")
        local dap_go = require("dap-go")
        local telescope = require('telescope')

        dapui.setup()
        dap_virtual_text.setup({
            enabled = true,                      -- enable this plugin (the default)
            enabled_commands = true,             -- create commands DapVirtualTextEnable, DapVirtualTextDisable, and DapVirtualTextToggle (the default)
            highlight_changed_variables = true,  -- highlight changed values with NvimDapVirtualTextChanged (the default)
            highlight_new_as_changed = false,    -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true,             -- show stop reason when stopped for exceptions
            commented = false,                   -- prefix virtual text with comment string
            only_first_definition = true,        -- only show virtual text at first definition (if there are multiple)
            all_references = false,              -- show virtual text on all references of the variable (not only definitions)
            filter_references_pattern = '<module>',  -- pattern for filtering references (modname/functionname is shown)
        })
        telescope.load_extension('dap')
        dap_go.setup()

        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

        -- Setup DAP for LLDB (Rust)
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
                        completion = "file"
                    })
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
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- DAP keymaps
        local keymap = vim.keymap.set
        local opts = { desc = "", noremap = true, silent = true }

        keymap("n", "<leader>db", function() dap.toggle_breakpoint() end, vim.tbl_extend("keep", opts, { desc = "Toggle Breakpoint" }))
        keymap("n", "<leader>dc", function() dap.continue() end, vim.tbl_extend("keep", opts, { desc = "Continue" }))
        keymap("n", "<leader>dso", function() dap.step_over() end, vim.tbl_extend("keep", opts, { desc = "Step Over" }))
        keymap("n", "<leader>dsi", function() dap.step_into() end, vim.tbl_extend("keep", opts, { desc = "Step Into" }))
        keymap("n", "<leader>dsx", function() dap.step_out() end, vim.tbl_extend("keep", opts, { desc = "Step Out" }))
        keymap("n", "<leader>dr", function() dap.repl.open() end, vim.tbl_extend("keep", opts, { desc = "Open REPL" }))
        keymap("n", "<leader>dl", function() dap.run_last() end, vim.tbl_extend("keep", opts, { desc = "Run Last" }))
        keymap("n", "<leader>dt", function() dap_go.debug_test() end, vim.tbl_extend("keep", opts, { desc = "Debug Test" }))
        keymap({ "n", "v" }, "<leader>dh", function() require("dap.ui.widgets").hover() end, vim.tbl_extend("keep", opts, { desc = "Hover" }))
        keymap({ "n", "v" }, "<leader>dp", function() require("dap.ui.widgets").preview() end, vim.tbl_extend("keep", opts, { desc = "Preview" }))
        keymap("n", "<leader>df", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end, vim.tbl_extend("keep", opts, { desc = "Frames" }))
        keymap("n", "<leader>dw", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end, vim.tbl_extend("keep", opts, { desc = "Scopes" }))
    end,
}

