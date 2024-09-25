-- Path executables
vim.g.python3_host_prog = os.getenv("PYTHON_EXE")

-- Powershell settings
local powershell_options = {
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}
for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

-- Defaults
vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.bo.autoindent = false
vim.o.swapfile = false
vim.o.conceallevel = 1
vim.wo.number = true
vim.wo.cursorline = true

vim.opt.relativenumber = true
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
