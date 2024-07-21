return {
    {
        "https://github.com/folke/which-key.nvim.git",
        event = "VeryLazy",
        init = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
        end,
        opts = {
            preset = "modern",
        },
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
              enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
              suggestions = 20, -- how many suggestions should be shown in the list?
            },
        },
        wo = {
            winblend = 50,
        },
    },
}
