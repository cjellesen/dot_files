return {
	cmd = {
		"ruff", "server",
	},
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {
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
    log_level = vim.lsp.protocol.MessageType.Warning,
}
