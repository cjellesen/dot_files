local theme = {
    "catppuccin/nvim",
    config = function()
        require("catppuccin").setup({
            custom_highlights = function(colors)
                return {
                    -- In order to find the given type use :Inspect while over the symbol of interest
                    --["@lsp.type.enum.cs"] = { fg = colors.yellow, style = { "bold" } },
                }
            end,
            integrations = {
                cmp = true,
                gitsigns = true,
                harpoon = true,
                illuminate = true,
                indent_blankline = {
                    enabled = false,
                    scope_color = "sapphire",
                    colored_indent_levels = false,
                },
                mason = true,
                native_lsp = { enabled = true },
                notify = true,
                nvimtree = true,
                neotree = true,
                symbols_outline = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
            },
        })

        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}

return theme
