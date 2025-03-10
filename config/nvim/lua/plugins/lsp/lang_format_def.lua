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
			gofumpt = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
	pyright = {
		pyright = {
			disableOrganizedImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
	ruff = {
		ruff = {
			init_options = {
				settings = {
					organizeImports = true,
					fixAll = true,
					showSyntaxErrors = true,
					logLevel = "debug",
					lint = {
						enable = false,
						extendSelect = {"I"},
						quoteStyle = "double",
						indentStyle = "space",
						lineEnding = "auto",
					},
					codeAction = {
						disableRuleComment = {
							enable = false,
						},
						fixViolation = {
							enable = true
						},
					}
				},
			}
		}
	},
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
	"staticcheck", -- Golang
	"gofumpt", -- Golang
	"goimports_reviser", -- Golang
	"golines", -- Golang
	--"black", -- Python
	--"mypy", -- Python
}

return M
