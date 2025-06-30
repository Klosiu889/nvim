return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local lualine = require("lualine")
        local colors = require("catppuccin.palettes").get_palette()
        local options = require("catppuccin").options
        local transparent_bg = options.transparent_background and "NONE" or colors.mantle

        local theme = {
            normal = {
                a = { bg = "None", gui = "bold" },
                b = { bg = "None", gui = "bold" },
                c = { bg = "None", gui = "bold" },
                x = { bg = "None", gui = "bold" },
                y = { bg = "None", gui = "bold" },
                z = { bg = "None", gui = "bold" },
            },
            insert = {
                a = { bg = "None", gui = "bold" },
                b = { bg = "None", gui = "bold" },
                c = { bg = "None", gui = "bold" },
                x = { bg = "None", gui = "bold" },
                y = { bg = "None", gui = "bold" },
                z = { bg = "None", gui = "bold" },
            },
            visual = {
                a = { bg = "None", gui = "bold" },
                b = { bg = "None", gui = "bold" },
                c = { bg = "None", gui = "bold" },
                x = { bg = "None", gui = "bold" },
                y = { bg = "None", gui = "bold" },
                z = { bg = "None", gui = "bold" },
            },
            replace = {
                a = { bg = "None", gui = "bold" },
                b = { bg = "None", gui = "bold" },
                c = { bg = "None", gui = "bold" },
                x = { bg = "None", gui = "bold" },
                y = { bg = "None", gui = "bold" },
                z = { bg = "None", gui = "bold" },
            },
            command = {
                a = { bg = "None", gui = "bold" },
                b = { bg = "None", gui = "bold" },
                c = { bg = "None", gui = "bold" },
                x = { bg = "None", gui = "bold" },
                y = { bg = "None", gui = "bold" },
                z = { bg = "None", gui = "bold" },
            },
            inactive = {
                a = { bg = "None", gui = "bold" },
                b = { bg = "None", gui = "bold" },
                c = { bg = "None", gui = "bold" },
                x = { bg = "None", gui = "bold" },
                y = { bg = "None", gui = "bold" },
                z = { bg = "None", gui = "bold" },
            },
        }

        local mode_color = {
            n = colors.lavender,
            i = colors.green,
            v = colors.flamingo,
            [""] = colors.flamingo,
            V = colors.flamingo,
            c = colors.peach,
            no = colors.red,
            s = colors.yellow,
            S = colors.yellow,
            [""] = colors.yellow,
            ic = colors.peach,
            R = colors.maroon,
            Rv = colors.maroon,
            cv = colors.red,
            ce = colors.red,
            r = colors.blue,
            rm = colors.blue,
            ["r?"] = colors.blue,
            ["!"] = colors.red,
            t = colors.teal,
        }

        local transparent_component = { bg = transparent_bg, fg = colors.overlay1 }

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "Recording @" .. recording_register
            end
        end

        local function get_cwd()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end

        local mode = {
            "mode",
            icon = "",
            color = function()
                return { bg = mode_color[vim.fn.mode()], fg = colors.base }
            end,
            separator = { left = "", right = "" },
        }

        local diff = {
            "diff",
            color = { bg = colors.mauve, fg = colors.base, gui = "bold" },
            separator = { right = "" },
            symbols = { added = " ", modified = " ", removed = " " },
            colored = false,
        }

        local progress = {
            "progress",
            color = transparent_component,
        }

        local location = {
            "location",
            color = transparent_component,
        }

        local searchcount = {
            "searchcount",
            color = transparent_component,
        }

        local macro_recording = {
            show_macro_recording,
            color = transparent_component,
        }

        local sep = {
            "%=",
            color = transparent_component,
        }

        local diagnostics = {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            colored = true,
        }

        local branch = {
            "branch",
            icon = "",
            color = transparent_component,
        }

        local lsp = {
            "lsp_status",
            icon = "󰅡",
            color = transparent_component,
        }
        local filetype = {
            "filetype",
            color = { bg = colors.maroon, fg = colors.base, gui = "bold" },
            padding = { left = 1, right = 0 },
            colored = false,
            icon_only = true,
        }
        local filename = {
            "filename",
            color = { bg = colors.maroon, fg = colors.base, gui = "bold" },
            padding = { left = 0, right = 1 },
            file_status = false,
        }
        local cwd = {
            get_cwd,
            icon = "󰉖",
            color = { bg = colors.flamingo, fg = colors.base, gui = "bold" },
            separator = { left = "", right = "" },
        }
        lualine.setup({
            options = {
                theme = theme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                always_divide_middle = false,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { diff },
                lualine_c = { progress, location, searchcount, macro_recording, sep, diagnostics },
                lualine_x = { branch, lsp },
                lualine_y = { filetype, filename },
                lualine_z = { cwd },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
