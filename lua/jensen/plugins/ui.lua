return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                highlight = { "Normal" },
                char = "│",
                tab_char = "│",
            },
            whitespace = {
                highlight = { "Normal" },
                remove_blankline_trail = false,
            },
            scope = {
                show_start = false,
                show_end = false 
            },
            exclude = {
                filetypes = {
                    "help",
                    "lazy",
                },
            },
        },
    },
}
