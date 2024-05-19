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
	omnisharp = {
		omnisharp = {
			handlers = {
				["textDocument/definitions"] = function(...)
					return require("omnisharp_extended").handler(...)
				end,
			},
			keys = {
				{
					"gd",
					function()
						require("omnisharp_extended").telescope_lsp_definitions()
					end,
					desc = "[G]oto [D]efinition",
				},
				{
					"gr",
					function()
						require("omnisharp_extended").telescope_lsp_references()
					end,
					desc = "[G]oto [R]eferences",
				},
				{
					"gI",
					function()
						require("omnisharp_extended").telescope_lsp_implementation()
					end,
					desc = "[G]oto [I]mplementation",
				},
			},
			enable_roslyn_analyzers = true,
			organize_imports_on_format = true,
			enable_import_completion = true,
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
	"stylelua", -- Lua
	"gofumpt", -- Golang
	"goimports_reviser", -- Golang
	"golines", -- Golang
	"black", -- Python
	"mypy", -- Python
	"csharpier", -- CSharpier won't be installed via the tool, so install it via dotnet tool and place in /bin directory.
}

return M
