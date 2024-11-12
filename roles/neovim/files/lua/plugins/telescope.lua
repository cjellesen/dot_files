local telecscope_config = function()
	require("telescope").setup({
		-- You can put your default mappings / updates / etc. in here
		--  All the info you're looking for is in `:help telescope.setup()`
		--
		-- defaults = {
		--   mappings = {
		--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
		--   },
		-- },
		-- pickers = {}
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	})

	-- Enable Telescope extensions if they are installed
	pcall(require("telescope").load_extension, "fzf")
	pcall(require("telescope").load_extension, "ui-select")

	local builtin = require("telescope.builtin")
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(mode, keys, func, desc)
		if desc then
			desc = "Telescope: " .. desc
		end

		vim.keymap.set(mode, keys, func, { desc = desc })
	end

	-- See `:help telescope.builtin`
	nmap("n", "<leader>sb", function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, "[S]earch in current [B]uffer")

	nmap("n", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
	nmap("n", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
	nmap("n", "<leader>sf", builtin.find_files, "[S]earch [F]iles")
	nmap("n", "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
	nmap("n", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
	nmap("n", "<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
	nmap("n", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
	nmap("n", "<leader>sr", builtin.resume, "[S]earch [R]esume")
	nmap("n", "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
end

-- Fuzzy Finder (files, lsp, etc)
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = telecscope_config,
}
