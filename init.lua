local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.python3_host_prog = "C:/Users/Admin/AppData/Local/Programs/Python/Python312/python.exe"
vim.g.hurl_executable = "C:/ProgramData/chocolatey/lib/hurl/tools/hurl.exe"

require("vim-options")
require("lazy").setup("plugins")
require("plugins.lsp-config")
