return {
    {
        "https://github.com/NLKNguyen/papercolor-theme.git",
        config = function()
            vim.opt.termguicolors = true
            vim.opt.background = "light"
            vim.cmd.colorscheme("PaperColor")
        end
    },
}
