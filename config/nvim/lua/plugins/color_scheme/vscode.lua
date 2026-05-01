local theme = {
    "Mofiqul/vscode.nvim",
    config = function()
        require("vscode").setup({
            style = "dark",

            -- Enable transparent background
            transparent = true,

            -- Enable italic comment
            italic_comments = true,

            -- Enable italic inlay type hints
            italic_inlayhints = true,

            -- Underline `@markup.link.*` variants
            underline_links = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Apply theme colors to terminal
            terminal_colors = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                vscLineNumber = '#FFFFFF',

                -- This is in order for the pop ups to match the background color from the terminal
                vscPopupBack = "#1E1E2E",
            },

            group_overrides = {

                -- This re-color is based on Mofiqul/vscode
                -- Just a small recoloring to make it look like JetBrains Rider Dark

                -- Namespace
                ["@lsp.type.namespace.cs"] = { fg = "#c191ff", bold = true },

                -- Interface/Type Parameters
                ["@lsp.type.interface.cs"] = { fg = "#c191ff", bold = true },
                ["@lsp.type.typeParameter.cs"] = { fg = "#c191ff", bold = true },

                -- Classes
                ["@lsp.typemod.class.static.cs"] = { fg = "#c191ff", bold = true },
                ["@lsp.type.class.cs"] = { fg = "#c191ff", bold = true },
                ["@lsp.type.recordClass.cs"] = { fg = "#c191ff", bold = true },

                -- Struct/Enum
                ["@lsp.type.struct.cs"] = { fg = "#E1BFFF", bold = true },
                ["@lsp.type.recordStruct.cs"] = { fg = "#E1BFFF", bold = true },
                ["@lsp.type.enum.cs"] = { fg = "#E1BFFF", bold = true },

                -- Event/Delegate
                ["@lsp.type.event.cs"] = { fg = "#E1BFFF", bold = false },
                ["@lsp.type.delegate.cs"] = { fg = "#E1BFFF", bold = true },

                -- Method
                ["@lsp.type.method.cs"] = { fg = "#38C596", bold = true },
                ["@lsp.type.extensionMethod"] = { fg = "#38C596", bold = true },
                ["@function.method"] = { fg = "#38C596", bold = true },
                ["@function.method.call"] = { link = "@function.method" },

                -- Return
                ["@lsp.type.controlKeyword.cs"] = { fg = "#6c95eb", bold = false },
                ["@keyword.return"] = { fg = "#6c95eb" },
                ["@keyword.return.c_sharp"] = { link = "@keyword.return" },

                -- Types
                ["@lsp.type.keyword.cs"] = { fg = "#6C95EB", bold = false },
                ["@keyword"] = { fg = "#6C95EB", italic = false },
                ["@keyword.conditional"] = { fg = "#6C95EB", italic = false },
                ["@keyword.repeat"] = { fg = "#6C95EB", bold = true },

                -- Comment/Pragma
                ["@lsp.type.comment.cs"] = { fg = "#85C46C", italic = true },
                ["@lsp.type.xmlDocCommentText"] = { fg = "#85C46C", italic = true },
                ["@lsp.type.xmlDocCommentDelimiter"] = { fg = "#85C46C", italic = true },
                ["@lsp.type.xmlDocCommentName"] = { fg = "#487D34", italic = true },
                ["@lsp.type.xmlDocCommentAttributeName"] = { fg = "#487D34", italic = true },
                ["@lsp.type.macro.cs"] = { fg = "#6C95EB", bold = false },

                -- Number
                ["@lsp.type.number.cs"] = { fg = "#ED94C0", bold = true },
                ["@number"] = { fg = "#ED94C0", bold = true },

                -- Fields/Variables/Parameters
                ["@lsp.type.field.cs"] = { fg = "#66C3CC", bold = false },
                ["@field"] = { fg = "#66C3CC", bold = false },
                ["@lsp.type.property.cs"] = { fg = "#66C3CC", bold = false, },
                ["@property"] = { fg = "#66C3CC", bold = false, },
                ["@lsp.type.parameter.cs"] = { fg = "#ED8796", bold = false },
                ["@parameter"] = { fg = "#ED8796", bold = false },

                ["@lsp.type.variable.cs"] = { fg = "#BDBDBD", bold = false },
                ["@variable"] = { fg = "#BDBDBD", bold = false },
                ["@variable.parameter"] = { fg = "#ED8796" },
                ["@variable.parameter.c_sharp"] = { link = "@variable.parameter" },

                -- Boolean
                ["@boolean"] = { fg = "#6c95eb", italic = true },
                ["@boolean.c_sharp"] = { link = "@boolean" },
            },
        })
        vim.cmd.colorscheme("vscode")
    end,
}

return theme
