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

	-- Useful plugin to show you pending keybinds.
	require("plugins.which-key"),
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		options = { theme = "onedark" },
		config = function()
			require("lualine").setup({})
		end,
	},
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
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {},
	},
	require("plugins.telescope"),
	require("plugins.treesitter"),

	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	require("plugins.lsp.lsp"),
	require("plugins.lsp.conform"),
	require("plugins.lsp.lint"),
	require("plugins.lsp.trouble"),
	require("plugins.cmp"),
	require("plugins.autopairs"),
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

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	require("plugins.neo-tree"),
	require("plugins.gitsigns"),
	require("plugins.comments"),
}, {})

require("keymappings")
require("custom_functions")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2
