-- Check if the shell is PowerShell or not
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local shell = vim.fn.executable("bash") == 1 and "bash" or vim.o.shell

if is_windows then
    -- Powershell settings
    local powershell_options = {
        shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
else
    -- Use the WSL or Linux shell like bash or zsh
    vim.o.shell = shell -- Set shell to bash or the default
    vim.o.shellcmdflag = "-c"
    vim.o.shellquote = ""
    vim.o.shellredir = ">%s 2>&1"
    vim.o.shellpipe = "2>&1 | tee"
    vim.o.shellxquote = ""
end

-- Other defaults
vim.g.mapleader = " "
vim.o.guicursor = "n-v-c-i-ci-ve-r-cr-o:block"
vim.g.have_nerd_font = true
vim.bo.autoindent = true
vim.o.swapfile = false
vim.o.conceallevel = 1
vim.wo.number = true
vim.wo.cursorline = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.inccommand = "split"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true

return {}
