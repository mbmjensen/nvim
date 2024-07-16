return {
    {
        'https://github.com/stevearc/oil.nvim.git',
        lazy = false,
        dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
            columns = {},
        },
        keys = {
            {"-", "<CMD>Oil<CR>", desc = "Open parent director"}
        },
    }
}
