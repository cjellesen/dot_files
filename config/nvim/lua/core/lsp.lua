vim.lsp.config.roslyn = {
    cmd = {
        "language-server",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
    },
    filetypes = { "cs" },
    root_markers = {
        ".csproj",
        ".sln",
        ".git",
    },
    settings = {
        ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "fullSolution",
        }
    },
    capabilities = {
        textDocument = {
            diagnostic = {
                dynamicRegistration = true,
            }
        },
        workspace = {
            diagnostic = {
                refreshSupport = true
            }
        },
    },
    on_attach = function(client)
        client.server_capabilities.diagnosticProvider = {
            interFileDependencies = true,
            workspaceDiagnostics = true,
            workDoneProgress = true
        }
    end
}

vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ruff",
    "gopls",
    "roslyn",
    "yamlls"
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        }
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local ts_builtin = require("telescope.builtin")
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("gr", ts_builtin.lsp_references, "[G]o to [R]eferences")
        map("gI", ts_builtin.lsp_implementations, "[G]o to [I]mplementation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("gt", ts_builtin.lsp_type_definitions, "[G]o to [T]ype")
        map("<leader>cs", ts_builtin.lsp_document_symbols, "[C]ode [S]ymbols")
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        local function client_supports_method(client, method, bufnr)
            return client:supports_method(method, bufnr)
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
            client and client_supports_method(
                client,
                vim.lsp.protocol.Methods.textDocument_documentHighlight,
                event.buf
            )
        then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                end,
            })
        end

        if
            client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
        then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
        end
    end,
})
