return {
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
						extendSelect = { "I" },
						quoteStyle = "double",
						indentStyle = "space",
						lineEnding = "auto",
						lineLength = 120,
					},
					codeAction = {
						disableRuleComment = {
							enable = false,
						},
						fixViolation = {
							enable = true,
						},
					},
				},
			},
		},
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
	yamlls = {
		settings = {
			yaml = {
				yamlVersion = 1.2,
				format = {
					enable = true,
				},
				validate = true,
				hover = true,
				completion = true,
				schemaStore = {
					enable = true,
				},
				schemas = {
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
					["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
					["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
					["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
					["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
					["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
					["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
					["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
				},
			},
		},
	},
}
