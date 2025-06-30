return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local lualine = require("lualine")
        local C = require("catppuccin.palettes").get_palette()
        local O = require("catppuccin").options
        local custom = {}

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "Recording @" .. recording_register
            end
        end

        local transparent_bg = O.transparent_background and "NONE" or C.mantle
        custom.normal = {
            a = { bg = C.lavender, fg = C.mantle, gui = "bold" },
            b = { bg = C.surface0, fg = C.blue },
            c = { bg = transparent_bg, fg = C.text },
        }

        custom.insert = {

            a = { bg = C.green, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.green },
        }

        custom.terminal = {
            a = { bg = C.green, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.green },
        }

        custom.command = {
            a = { bg = C.peach, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.peach },
        }

        custom.visual = {
            a = { bg = C.flamingo, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.mauve },
        }

        custom.replace = {
            a = { bg = C.maroon, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.red },
        }

        custom.inactive = {
            a = { bg = transparent_bg, fg = C.blue },
            b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
            c = { bg = transparent_bg, fg = C.overlay0 },
        }

        local transparent_component = { bg = transparent_bg, fg = C.overlay1 }

        lualine.setup({
            options = {
                theme = custom,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                always_divide_middle = false,
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        icon = "",
                        separator = { left = "", right = "" },
                    },
                },
                lualine_b = {
                    {
                        "diff",
                        color = { bg = C.mauve, fg = C.base, gui = "bold" },
                        separator = { right = "" },
                        symbols = { added = " ", modified = " ", removed = " " },
                        colored = false,
                    },
                },
                lualine_c = {
                    {
                        "progress",
                        color = transparent_component,
                    },
                    {
                        "location",
                        color = transparent_component,
                    },
                    {
                        "searchcount",
                        color = transparent_component,
                    },
                    {
                        show_macro_recording,
                        color = transparent_component,
                    },
                    {
                        "%=",
                    },
                    {
                        "diagnostics",
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        colored = true,
                    },
                },
                lualine_x = {
                    {
                        "branch",
                        icon = "",
                        color = transparent_component,
                    },
                    {
                        "lsp_status",
                        icon = "󰅡",
                        color = transparent_component,
                    },
                },
                lualine_y = {
                    {
                        "filetype",
                        color = { bg = C.maroon, fg = C.base, gui = "bold" },
                        padding = { left = 1, right = 0 },
                        colored = false,
                        icon_only = true,
                    },
                    {
                        "filename",
                        color = { bg = C.maroon, fg = C.base, gui = "bold" },
                        padding = { left = 0, right = 1 },
                        file_status = false,
                    },
                },
                lualine_z = {
                    {
                        "filename",
                        icon = "󰉖",
                        color = { bg = C.flamingo, fg = C.base, gui = "bold" },
                        separator = { left = "", right = "" },
                        fmt = function(_)
                            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                        end,
                    },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
