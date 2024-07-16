return {
    {
        "https://github.com/folke/which-key.nvim.git",
        event = "VeryLazy",
        init = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
        end,
        opts = {},
    },
}
