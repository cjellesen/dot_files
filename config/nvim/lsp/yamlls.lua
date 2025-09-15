return {
  cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yml', 'yaml' },
    root_markers = { '.git' },
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
    log_level = vim.lsp.protocol.MessageType.Warning,
}
