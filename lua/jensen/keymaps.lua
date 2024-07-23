vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Readline style insert and command mode shortcuts
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Jump to start of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Jump to end of line" })
vim.keymap.set("i", "<C-k>", "<C-o>D", { desc = "Delete rest of line" })
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Jump to start of line" })
vim.keymap.set("c", "<C-e>", "<End>", { desc = "Jump to start of line" })
vim.keymap.set(
	"c",
	"<C-k>",
	"<C-\\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>",
	{ desc = "Delete rest of line" }
)
vim.keymap.set("c", "<C-b>", "<Left>", { desc = "Go left one character" })

-- Shortcuts for saving and quitting windows
vim.keymap.set("n", "<Leader>q", ":quit<CR>", { desc = "quit" })
vim.keymap.set("n", "<Leader>Q", ":quitall<CR>", { desc = "quitall" })
vim.keymap.set("n", "<Leader>w", ":write<CR>", { desc = "write" })
vim.keymap.set("n", "<Leader>x", ":xit<CR>", { desc = "xit" })

-- tpope style surround keybindings
-- Remap adding surrounding to Visual mode selection
vim.keymap.set("x", "ys", "<NOP>")
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

-- Make special mapping for "add surrounding for line"
vim.keymap.set("n", "yss", "ys_", { remap = true })

-- Make it easier to search through search and command histories
vim.keymap.set("n", "q/", "<Leader>Telescope search_history<CR>", { desc = "Search / history" })
vim.keymap.set("n", "q:", "<Leader>Telescope command_history<CR>", { desc = "Search command history" })

-- Use s for [s]earch instead of [s]ubstitute
vim.keymap.set({ "n" }, "s", "<NOP>")

vim.keymap.set("n", "s;", "<CMD>Telescope commands<CR>", { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "sb", "<CMD>Telescope buffers<CR>", { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "sf", "<CMD>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "sh", "<CMD>Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })

-- Git Keymappings
vim.keymap.set("n", "<Leader>gs", "<CMD>Git<CR>", { desc = "git summary" })
vim.keymap.set("n", "<Leader>gS", "<CMD>Git | only<CR>", { desc = "git fullscreen-summary" })
