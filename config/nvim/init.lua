-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("options")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
	-- NOTE: First, some plugins that don't require any configuration

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-sleuth",

	"nvim-tree/nvim-web-devicons",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-rhubarb",
	{
		-- Theme inspired by Atom
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = false,
				term_colors = true,
				highlights = {
					-- ["@lsp.type.enum"] = { fg = "#b8cee3" },
					-- ["@lsp.type.interface"] = { fg = "" },
					-- ["@lsp.type.struct"] = { fg = "#b8cee3" },
					["@lsp.type.namespace"] = { fg = "#3cb043" },
					-- ["@property"] = { fg = "#4287f5" },
					-- ["@variable"] = { fg = "#a3ced4" },
					-- ["@type"] = { fg = "#000000" },
				},
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.lsp.autoformat"),

	require("plugins.lsp.lsp"),
	require("plugins.lsp.none-ls"),
	require("plugins.cmp"),
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	require("plugins.gitsigns"),
	require("plugins.comments"),
}, {})

require("keymappings")
require("custom_functions")

-- document existing key chains
require("which-key").register({
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	["<leader>g"] = { name = "[G]reb Search", _ = "which_key_ignore" },
	["<leader>s"] = { name = "[S]earch [F]iles", _ = "which_key_ignore" },
	["<leader>t"] = { name = "[T]ab Management", _ = "which_key_ignore" },
	["<leader>f"] = { name = "[F]le Browser", _ = "which_key_ignore" },
	["<leader>b"] = { name = "[B]rowser", _ = "which_key_ignore" },
})

-- Opens a file browser
vim.keymap.set("n", "<space>fb", "Telescope file_browser<CR>", { desc = "Open [F]ile [B]rowser" })

-- open file_browser with the path of the current buffer
vim.keymap.set(
	"n",
	"<space>fc",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ desc = "Open [F]ile browser in [C]urrent directory" }
)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 e
