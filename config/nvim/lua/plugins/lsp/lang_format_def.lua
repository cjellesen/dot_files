local M = {}

M.Servers = {
	--  If autocomplete of code snippets are not working uncomment all language servers except the
	--  one in question. I had an issue where pyright interferred and function parameters in golang
	--  and lua did not autocomplete as a result.
	-- clangd = {},
	gopls = {
		gopls = {
			staticcheck = true,
			completeUnimported = true,
			usePlaceholders = true,
			semanticTokens = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
	pyright = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			completion = { callSnippet = "Replace" },
		},
	},

	zls = {
		zls = {
			enable_autofix = true,
			warn_style = true,
		},
	},
}

M.Formatters = {
	"stylua", -- Lua
	"gofumpt", -- Golang
	"goimports_reviser", -- Golang
	"golines", -- Golang
	"black", -- Python
	"mypy", -- Python
}

return M
