local LAZY_REPO = "https://github.com/folke/lazy.nvim.git"

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
    local system_out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable", -- latest stable release
        LAZY_REPO,
        lazy_path,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { system_out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
    spec = {
        { import = "jensen.plugins" },
    },
    ui = {
        border = "rounded",
    },
    install = {
        colorscheme = {
            "PaperColor",
            "habamax",
        }
    },
    change_detection = {
        enabled = false,
    },
})
