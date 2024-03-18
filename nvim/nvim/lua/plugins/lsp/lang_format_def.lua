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
      analyses = {
        unusedparams = true,
      }
    },
  },
  pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      completion = { callSnippet = 'Replace' },
    },
  },
}

M.Formatters = {
  go = {"gofumpt", "goimports_reviser", "golines"},
  py = {"black", "flake8", "mypy"}
}

return M
