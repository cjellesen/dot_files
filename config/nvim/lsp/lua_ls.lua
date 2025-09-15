return {
	cmd = {
		"lua-language-server",
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
    settings = {
        Lua = {
             runtime = {
               version = 'LuaJIT',
             },
             -- This along with the workspace is require for Lua to get access to the Neovim internals
             workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            },
            diagnostics = {
                globals = { 'vim' },
            },
        }
    },
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
