-- Leader Keys
vim.g.mapleader = " "

-- Indent Settings
vim.opt.shiftwidth = 4 -- Indent with 4 spaces
vim.opt.tabstop = 4 -- Show tabs as 4 spaces

-- Line Wrap Settings
vim.opt.breakindent = true -- Indent wrapped lines
vim.opt.linebreak = true -- Wrap lines at word boundaries

-- Window Settings
vim.opt.splitbelow = true -- New windows go below
vim.opt.splitright = true -- and right of a split

vim.opt.laststatus = 3 -- Display only a single, permanent status bar at the bottom of the screen

-- Search Settings
vim.opt.ignorecase = true -- Make the search case-insensitive by default
vim.opt.smartcase = true -- unless an uppercase character is in the pattern

vim.opt.hlsearch = false -- Do not highlight search results after searching

-- List Characters
vim.opt.list = true -- Turn on list characters by default
vim.opt.listchars = {
	tab = "» ", -- Tab characters, preserve width
	extends = "›", -- Unwrapped text to screen right
	precedes = "‹", -- Unwrapped text to screen left
	trail = "•", -- Trailing spaces
	nbsp = "•", -- Non-breaking spaces
}

-- Clipboard: use OSC52 for the + register so copies reach the system clipboard
-- even over SSH or inside tmux. The cp/cv keymaps in keymaps.lua rely on this.
vim.g.clipboard = {
	name = 'OSC 52',
	copy = {
		['+'] = require('vim.ui.clipboard.osc52').copy('+'),
		['*'] = require('vim.ui.clipboard.osc52').copy('*'),
	},
	paste = {
		['+'] = require('vim.ui.clipboard.osc52').paste('+'),
		['*'] = require('vim.ui.clipboard.osc52').paste('*'),
	},
}

-- Misc Settings
vim.opt.confirm = true -- Prompt instead of rejecting commands such as a risky :write
vim.opt.undofile = true -- Persist undo history for files between file reads
vim.opt.termguicolors = true -- Enable 24-bit RGB colors in the terminal (colorscheme)
vim.opt.timeout = true -- Enable key sequence timeout (which-key)
vim.opt.timeoutlen = 300 -- Milliseconds to wait for a key sequence to complete (which-key)
