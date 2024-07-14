-- Indent Settings
vim.opt.expandtab = true               -- Use spaces instead of tabs
vim.opt.shiftwidth = 4                 -- Indent with 4 spaces
vim.opt.softtabstop = 4                -- Count tabs as 4 spaces for editing operations

-- Line Wrap Settings
vim.opt.breakindent = true             -- Indent wrapped lines
vim.opt.showbreak= "..."               -- Prefix wrapped rows with 3 dots
vim.opt.linebreak = true               -- Wrap lines at word boundaries

-- Window Settings
vim.opt.splitbelow = true              -- New windows go below
vim.opt.splitright = true              -- and right of a split

vim.opt.laststatus = 3                 -- Display only a single, permanent status bar
                                       -- at the bottom of the screen

-- Search Settings
vim.opt.ignorecase = true              -- Make the search case-insensitive by default
vim.opt.smartcase = true               -- unless an uppercase character is in the pattern

vim.opt.hlsearch = false               -- Do not highlight search results after searching

-- List Characters
vim.opt.list = true                    -- Turn on list characters by default
vim.opt.listchars = {
    tab = "» ",                        -- Tab characters, preserve width
    extends = "›",                     -- Unwrapped text to screen right
    precedes = "‹",                    -- Unwrapped text to screen left
    trail = "•",                       -- Trailing spaces
    nbsp = "•",                        -- Non-breaking spaces
}


-- Misc Settings
vim.opt.confirm = true                 -- Prompt instead of rejecting commands such as a risky :write
vim.opt.undofile = true                -- Persist undo history for files between file reads
