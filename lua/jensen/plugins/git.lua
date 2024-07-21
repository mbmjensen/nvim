return {
    {
        "https://github.com/tpope/vim-rhubarb.git",
        lazy = true,
        cmd = "GBrowse",
        dependencies = {
            "https://github.com/tpope/vim-fugitive.git",
        }
    },
    {
        "https://github.com/tpope/vim-fugitive.git",
        cmd = { "Git", "GBrowse" },
        lazy = true,
        keys = {
            {"<Leader>gb", "<CMD>Git blame<CR>", desc = "git blame"},
        }
    },
    {
        "https://github.com/lewis6991/gitsigns.nvim.git",
        opts = {}
    },
}
