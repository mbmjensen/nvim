local opt = vim.opt

-- Indent Settings
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4

-- Line Wrap Settings
opt.breakindent = true  -- Indent wrapped lines
opt.showbreak= "..."  -- Prefix wrapped rows with 3 dots
opt.linebreak = true  -- Wrap lines at word boundaries

-- Search Settings
opt.ignorecase = true  -- Make the search case-insensitive by default
opt.smartcase = true  -- Unless an uppercase character is in the pattern
