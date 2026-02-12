local treesitter_config = function()
	local options = {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = {
			"go",
			"lua",
			"python",
			"vimdoc",
			"vim",
			"bash",
			"c_sharp",
			"dockerfile",
			"json",
			"hcl",
			"toml",
			"yaml",
		},

		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		auto_install = true,

		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-s>",
				node_decremental = "<M-space>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
		},
	}
	vim.filetype.add({
		extension = {
			gotmpl = "gotmpl",
		},
		pattern = {
			[".*/templates/.*%.tpl"] = "helm",
			[".*/templates/.*%.ya?ml"] = "helm",
			["helmfile.*%.ya?ml"] = "helm",
		},
	})

	vim.filetype.add({
		pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
	})

	-- Disclaimer: This was from Kickstart Nvim and I do not know of adding the defer_fn here yields the same result as putting
	-- it after the lazy setup in the init.lua file.
	-- The original documentation from the Kickstart guide said: "Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'"
	vim.defer_fn(function()
		require("nvim-treesitter.config").setup(options)
	end, 0)
end

return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = treesitter_config,
}
