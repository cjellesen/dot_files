local none_ls_config = function()
	local mason_null_ls = require("mason-null-ls")
	local null_ls = require("null-ls")
	local null_ls_utils = require("null-ls.utils")

	-- local formatters = require("plugins.lsp.lang_format_def").Formatters
	mason_null_ls.setup({
		ensure_installed = {
			"stylua", -- lua formatter
			"black", -- python formatter
			"flake8", -- python linter
			"mypy",
			"gofumpt",
			"goimports",
			"golines",
		},
	})

	-- for conciseness
	local formatting = null_ls.builtins.formatting -- to setup formatters
	local diagnostics = null_ls.builtins.diagnostics -- to setup linters

	-- to setup format on save
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- configure null_ls
	null_ls.setup({
		-- add package.json as identifier for root (for typescript monorepos)
		root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git"),
		-- setup formatters & linters
		sources = {
			-- Lua
			formatting.stylua,

			-- Python
			formatting.black,
			diagnostics.flake8,
			diagnostics.mypy.with({
				extra_args = function()
					local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
					return { "--python-executable", virtual .. "/bin/python3" }
				end,
			}),

			-- Go
			formatting.gofmt,
			formatting.goimports,
			formatting.golines,
		},
		-- configure format on save
		on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								--  only use null-ls for formatting instead of lsp server
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end,
	})
end

return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	-- lazy = true,
	-- event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	dependencies = { "jay-babu/mason-null-ls.nvim" },
	config = none_ls_config,
}
