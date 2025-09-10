-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		default_source = "filesystem",
		sort_case_insensitive = true,
		enable_diagnostics = true,
		source_selector = {
			show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
			-- of the top visible node when scrolled down.
			sources = { -- falls back to source_name if nil
				{ source = "filesystem", display_name = " 󰉓 Files " },
				{ source = "git_status", display_name = " 󰊢 Git " },
				{ source = "document_symbols", display_name = " 󰊕 Symbols " },
			},
			content_layout = "center", -- only with `tabs_layout` = "equal", "focus"
			tabs_layout = "equal", -- start, end, center, equal, focus
			truncation_character = "…", -- character to use when truncating the tab label
			padding = 0, -- can be int or table
			separator = { left = "▏", right = "▕" },
			show_separator_on_edge = false,
		},
		default_component_configs = {
			container = {
				enable_character_fade = true,
				width = "100%",
				right_padding = 0,
			},
			modified = {
				symbol = "[+] ",
				highlight = "NeoTreeModified",
			},
			name = { use_git_status_colors = true },
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- NOTE: you can set any of these to an empty string to not show them
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
				align = "right",
			},
			symlink_target = {
				enabled = true,
			},
		},
		git_status = {
			window = {
				mappings = {
					["A"] = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
					["i"] = "show_file_details",
					["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
					["oc"] = { "order_by_created", nowait = false },
					["od"] = { "order_by_diagnostics", nowait = false },
					["om"] = { "order_by_modified", nowait = false },
					["on"] = { "order_by_name", nowait = false },
					["os"] = { "order_by_size", nowait = false },
					["ot"] = { "order_by_type", nowait = false },
				},
			},
		},
		document_symbols = {
			follow_cursor = false,
			client_filters = "first",
			renderers = {
				root = {
					{ "indent" },
					{ "icon", default = "C" },
					{ "name", zindex = 10 },
				},
				symbol = {
					{ "indent", with_expanders = true },
					{ "kind_icon", default = "?" },
					{
						"container",
						content = {
							{ "name", zindex = 10 },
							{ "kind_name", zindex = 20, align = "right" },
						},
					},
				},
			},
			window = {
				mappings = {
					["<cr>"] = "jump_to_symbol",
					["o"] = "jump_to_symbol",
					["A"] = "noop", -- also accepts the config.show_path and config.insert_as options.
					["d"] = "noop",
					["y"] = "noop",
					["x"] = "noop",
					["p"] = "noop",
					["c"] = "noop",
					["m"] = "noop",
					["a"] = "noop",
					["/"] = "filter",
					["f"] = "filter_on_submit",
				},
			},
			custom_kinds = {
				-- define custom kinds here (also remember to add icon and hl group to kinds)
				-- ccls
				-- [252] = 'TypeAlias',
				-- [253] = 'Parameter',
				-- [254] = 'StaticMethod',
				-- [255] = 'Macro',
			},
			kinds = {
				Unknown = { icon = "?", hl = "" },
				Root = { icon = "", hl = "NeoTreeRootName" },
				File = { icon = "󰈙", hl = "Tag" },
				Module = { icon = "", hl = "Exception" },
				Namespace = { icon = "󰌗", hl = "Include" },
				Package = { icon = "󰏖", hl = "Label" },
				Class = { icon = "󰌗", hl = "Include" },
				Method = { icon = "", hl = "Function" },
				Property = { icon = "󰆧", hl = "@property" },
				Field = { icon = "", hl = "@field" },
				Constructor = { icon = "", hl = "@constructor" },
				Enum = { icon = "󰒻", hl = "@number" },
				Interface = { icon = "", hl = "Type" },
				Function = { icon = "󰊕", hl = "Function" },
				Variable = { icon = "", hl = "@variable" },
				Constant = { icon = "", hl = "Constant" },
				String = { icon = "󰀬", hl = "String" },
				Number = { icon = "󰎠", hl = "Number" },
				Boolean = { icon = "", hl = "Boolean" },
				Array = { icon = "󰅪", hl = "Type" },
				Object = { icon = "󰅩", hl = "Type" },
				Key = { icon = "󰌋", hl = "" },
				Null = { icon = "", hl = "Constant" },
				EnumMember = { icon = "", hl = "Number" },
				Struct = { icon = "󰌗", hl = "Type" },
				Event = { icon = "", hl = "Constant" },
				Operator = { icon = "󰆕", hl = "Operator" },
				TypeParameter = { icon = "󰊄", hl = "Type" },

				-- ccls
				-- TypeAlias = { icon = ' ', hl = 'Type' },
				-- Parameter = { icon = ' ', hl = '@parameter' },
				-- StaticMethod = { icon = '󰠄 ', hl = 'Function' },
				-- Macro = { icon = ' ', hl = 'Macro' },
			},
		},
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
