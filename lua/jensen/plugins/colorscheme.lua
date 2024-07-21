return {
    {
        "https://github.com/NLKNguyen/papercolor-theme.git",
        lazy=false,     -- Ensure that the colorscheme loads before other plugins
        priority=100,   -- which might set their colors using the colorscheme.
        config = function()
            -- Always run before loading PaperColor to properly configure colors
            vim.api.nvim_create_autocmd("ColorSchemePre", {
                pattern = "PaperColor",
                callback = function(ev)
                    vim.opt.termguicolors = true
                    vim.opt.background = "light"
                end,
            })

            -- Apply custom color overrides immediately after loading PaperColor
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "PaperColor",
                callback = function(ev)
                    vim.cmd.highlight("CursorLineNr guibg=none")
                    vim.cmd.highlight("Conceal guibg=none")
                    vim.cmd.highlight("EndOfBuffer guifg=#b2b2b2 guibg=none")
                    vim.cmd.highlight("LineNr guibg=none")
                    vim.cmd.highlight("NonText guibg=none")
                    vim.cmd.highlight("Normal guibg=none")
                    vim.cmd.highlight("NormalFloat guibg=none")
                    vim.cmd.highlight("NormalNC guibg=none")
                    vim.cmd.highlight("SignColumn guibg=none")
                    vim.cmd.highlight("Whitespace guibg=none")

                    vim.cmd.highlight("IncSearch gui=reverse guifg=none guibg=none")
                    vim.cmd.highlight("Search gui=reverse guifg=none guibg=none")

                    vim.cmd.highlight("LazyButton guifg=#444444 guibg=none")
                    vim.cmd.highlight("LazyButtonActive gui=bold guifg=#d75f00 guibg=none")
                    vim.cmd.highlight("LazyH1 gui=bold guifg=#d75f00 guibg=none")
                    vim.cmd.highlight("LazyH2 guifg=#005faf guibg=none")

                    vim.cmd.highlight("DiagnosticError guibg=none")
                    vim.cmd.highlight("DiagnosticWarn gui=bold guifg=green guibg=none")
                    vim.cmd.highlight("DiagnosticHint gui=bold guifg=green guibg=none")
                    vim.cmd.highlight("LspDiagnosticsDefaultInformation guibg=none")
                end,
            })

            -- Use PaperColor as the default colorscheme
            vim.cmd.colorscheme("PaperColor")
        end,
    },
}
