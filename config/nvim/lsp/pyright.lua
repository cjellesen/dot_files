return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
        '.git',
    },
    settings = {
		pyright = {
			disableOrganizedImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
    },
    log_level = vim.lsp.protocol.MessageType.Warning,
}
