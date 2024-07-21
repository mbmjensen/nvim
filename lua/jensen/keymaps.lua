vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Readline style insert and command mode shortcuts
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Jump to start of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Jump to end of line" })
vim.keymap.set("i", "<C-k>", "<C-o>D", { desc = "Delete rest of line" })
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Jump to start of line" })
vim.keymap.set("c", "<C-e>", "<End>", { desc = "Jump to start of line" })
vim.keymap.set("c", "<C-k>", "<C-\\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>", { desc = "Delete rest of line" })
vim.keymap.set("c", "<C-b>", "<Left>", { desc = "Go left one character" })

-- Shortcuts for saving and quitting windows
vim.keymap.set("n", "<Leader>q", ':quit<CR>', { desc = 'quit' })
vim.keymap.set("n", "<Leader>Q", ':quitall<CR>', { desc = 'quitall' })
vim.keymap.set("n", "<Leader>w", ':write<CR>', { desc = 'write' })
vim.keymap.set("n", "<Leader>x", ':xit<CR>', { desc = 'xit' })
