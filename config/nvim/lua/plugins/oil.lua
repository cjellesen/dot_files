return{
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = {{ "echasnovski/mini.icons", opts = {} }},
        lazy = false
    },
    {
        "benomahony/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim"},
        opt = {},
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opt = {},
    }
}
