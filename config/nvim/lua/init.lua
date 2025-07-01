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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato",
			term_colors = true,
		},
	},

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
		options = { theme = "catppuccin" },
		config = function()
			require("lualine").setup({})
		end,
	},

	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		vscode = false,
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			filewatching = "roslyn",
		},
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
	{ "artemave/workspace-diagnostics.nvim" },
	require("plugins.lsp.lsp"),
	require("plugins.lsp.conform"),
	require("plugins.lsp.lint"),
	require("plugins.lsp.trouble"),
	require("plugins.cmp"),
	require("plugins.autopairs"),
	{
		"stevearc/dressing.nvim",
		opts = {},
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
	require("plugins.noice"),
}, {})

require("keymappings")
require("custom_functions")

vim.cmd.colorscheme("catppuccin")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2
