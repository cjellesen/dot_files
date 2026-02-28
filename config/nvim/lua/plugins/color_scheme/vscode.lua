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

                -- Variables
                ["@variable"] = { fg = "#bdbdbd" },
                ["@variable.c_sharp"] = { link = "@variable" },
                ["@variable.member.c_sharp"] = { fg = "#65c3cc" },
                ["@variable.parameter"] = { fg = "#ed8796" },
                ["@variable.parameter.c_sharp"] = { link = "@variable.parameter" },

                ["@keyword.repeat"] = { fg = "#6c95eb", bold = true },
                ["@keyword.repeat.c_sharp"] = { link = "@keyword.repeat" },

                -- Boolean
                ["@boolean"] = { fg = "#6c95eb", italic = true },
                ["@boolean.c_sharp"] = { link = "@boolean" },

                -- Return
                ["@keyword.return"] = { fg = "#6c95eb" },
                ["@keyword.return.c_sharp"] = { link = "@keyword.return" },

                -- Method
                ["@function.method"] = { fg = "#38c596", bold = true },
                ["@function.method.call"] = { link = "@function.method" },
                ["@function.method.call.c_sharp"] = { link = "@function.method" },
                ["@lsp.type.extensionMethod"] = { fg = "#38c596", bold = true },

                -- Types (mots clés)
                ["@keyword"] = { fg = "#6c95eb", italic = false },
                ["@keyword.conditional"] = { fg = "#6c95eb", italic = false },
                ["@keyword.conditional.c_sharp"] = { link = "@keyword.conditional" },

                -- Classes
                ["@lsp.type.class.cs"] = { fg = "#c191ff", bold = true },

                -- Enum
                ["@lsp.type.enum.cs"] = { fg = "#4EC9B0", bold = true },

                -- Number
                ["@number"] = { fg = "#e791bc", bold = true },
                ["@number.c_sharp"] = { link = "@number" },

                -- Comment
                ["Comment"] = { fg = "#84c26b", italic = true },
            },
        })
        vim.cmd.colorscheme("vscode")
    end,
}

return theme
