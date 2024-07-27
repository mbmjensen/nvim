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
vim.keymap.set("n", "q/", "<CMD>Telescope search_history<CR>", { desc = "Search / history" })
vim.keymap.set("n", "q:", "<CMD>Telescope command_history<CR>", { desc = "Search command history" })

-- Use s for [s]earch instead of [s]ubstitute
vim.keymap.set({ "n" }, "s", "<NOP>")

vim.keymap.set("n", "s;", "<CMD>Telescope commands<CR>", { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "sb", "<CMD>Telescope buffers<CR>", { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "sf", "<CMD>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "sh", "<CMD>Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "sc", "<CMD>Telescope git_commits<CR>", { desc = "[S]earch [C]ommits" })
vim.keymap.set("n", "sC", "<CMD>Telescope git_bcommits<CR>", { desc = "buffer-commits" })
vim.keymap.set("n", "st", "<CMD>Telescope<CR>", { desc = "telescope" })

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
vim.keymap.set("n", "<Leader>oq", "<CMD>copen<CR>", { desc = "Open quickfix" })
vim.keymap.set("n", "<Leader>ot", "<CMD>startinsert | terminal<CR>", { desc = "Open terminal" })
vim.keymap.set("n", "<Leader>od", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<Leader>oq", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix (Trouble)" })


-- LSP keybindings (stolen from kickstarter)
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		-- NOTE: Remember that Lua is a real programming language, and as such it is possible
		-- to define small helper and utility functions so you don't have to repeat yourself.
		--
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

		-- Find references for the word under your cursor.
		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

		-- Opens a popup that displays documentation about the word under your cursor
		--  See `:help K` for why this keymap.
		map('K', vim.lsp.buf.hover, 'Hover Documentation')

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
			end,
		})
	end
})
