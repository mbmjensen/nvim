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
vim.keymap.set("n", "q/", function() Snacks.picker.search_history() end, { desc = "Search / history" })
vim.keymap.set("n", "q:", function() Snacks.picker.command_history() end, { desc = "Search command history" })

-- Use s for [s]earch instead of [s]ubstitute
vim.keymap.set({ "n" }, "s", "<NOP>")

vim.keymap.set("n", "s;", function() Snacks.picker.commands() end, { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "sb", function() Snacks.picker.buffers() end, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "sf", function() Snacks.picker.files() end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "sh", function() Snacks.picker.help() end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "sc", function() Snacks.picker.git_log() end, { desc = "[S]earch [C]ommits" })
vim.keymap.set("n", "sC", function() Snacks.picker.git_log_file() end, { desc = "buffer-commits" })
vim.keymap.set("n", "st", function() Snacks.picker.pickers() end, { desc = "pickers" })

-- Git Keymappings
vim.keymap.set("n", "<Leader>gs", "<CMD>Git<CR>", { desc = "git summary" })
vim.keymap.set("n", "<Leader>gS", "<CMD>Git | only<CR>", { desc = "git fullscreen-summary" })

-- Option Toggles
vim.keymap.set("n", "<Leader>ts", "<CMD>set spell!<CR>", { desc = "Toggle spelling" })
vim.keymap.set("n", "<Leader>tw", "<CMD>set wrap!<CR>", { desc = "Toggle line wrap" })
vim.keymap.set("n", "<Leader>tn", "<CMD>set number!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<Leader>tg", "<CMD>Gitsigns toggle_signs<CR>", { desc = "Toggle git signs" })
vim.keymap.set("n", "<Leader>tc", "<CMD>TSContextToggle<CR>", { desc = "Toggle treesitter context" })


-- Open Keymappings
vim.keymap.set("n", "<Leader>oz", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
vim.keymap.set("n", "<Leader>om", "<CMD>Mason<CR>", { desc = "Open Mason" })
vim.keymap.set("n", "<Leader>ot", "<CMD>startinsert | terminal<CR>", { desc = "Open terminal" })
vim.keymap.set("n", "<Leader>od", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<Leader>oq", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix (Trouble)" })


-- System clipboard copy and paste
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'cpp', '"+yy', { desc = 'Copy line to system clipboard' })
vim.keymap.set('n', 'cv', '"+p', { desc = 'Paste from system clipboard' })

-- LSP keymaps
vim.keymap.set("n", "<Leader>ls", "<CMD>LspStart<CR>", { desc = "Start LSP" })
vim.keymap.set("n", "<Leader>lr", "<CMD>LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "<Leader>li", "<CMD>LspInfo<CR>", { desc = "LSP Info" })
