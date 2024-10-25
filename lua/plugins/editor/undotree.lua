return {
    "mbbill/undotree",
    config = function()
        -- Check if running in WSL or Unix-like environment
        if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
            -- Use the correct diff command for Windows
            vim.g.undotree_DiffCommand = '"C:/Program Files/Git/bin/bash.exe" -c "diff"'  -- Escape spaces properly
        else
            -- Use the standard diff command in Unix-like environments (including WSL)
            vim.g.undotree_DiffCommand = "diff"
        end

        -- Keymap to toggle undotree
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
}

