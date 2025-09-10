return {
	--  If autocomplete of code snippets are not working uncomment all language servers except the
	--  one in question. I had an issue where pyright interferred and function parameters in golang
	--  and lua did not autocomplete as a result.
	-- clangd = {},
	gopls = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			semanticTokens = true,
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
					kubernetes = "*.yaml",
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
	roslyn = {
		settings = {
			["csharp|background_analysis"] = {
				dotnet_analyzer_diagnostics_scope = "fullSolution",
				dotnet_compiler_diagnostics_scope = "fullSolution",
			},
			["csharp|code_lens"] = {
				dotnet_enable_references_code_lens = true,
				dotnet_enable_test_code_lens = true,
			},
			["csharp|completion"] = {
				dotnet_provide_regex_completions = true,
				dotnet_show_completion_items_from_unimported_namespaces = true,
				dotnet_show_name_completion_suggestions = true,
			},
			["csharp|inlay_hints"] = {
				csharp_enable_inlay_hints_for_implicit_object_creation = true,
				csharp_enable_inlay_hints_for_implicit_variable_types = true,
				csharp_enable_inlay_hints_for_lambda_parameter_types = true,
				csharp_enable_inlay_hints_for_types = true,
				dotnet_enable_inlay_hints_for_indexer_parameters = true,
				dotnet_enable_inlay_hints_for_object_creation_parameters = true,
				dotnet_enable_inlay_hints_for_other_parameters = true,
				dotnet_enable_inlay_hints_for_parameters = true,
				dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
				dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
				dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
			},
			["csharp|symbol_search"] = {
				dotnet_search_reference_assemblies = true,
			},
			["csharp|formatting"] = {
				dotnet_organize_imports_on_format = true,
			},
		},
	},
}
