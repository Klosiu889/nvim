return {
    "feline-nvim/feline.nvim",
    config = function()
        local C = require("catppuccin.palettes").get_palette()
        local lsp = require("feline.providers.lsp")
        local ctp_feline = require("catppuccin.groups.integrations.feline")

        -- Making feline consistent with diagnostics colors
        local components = ctp_feline.get()
        components.active[2][5] = {
            provider = "diagnostic_hints",
            enabled = function()
                return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
            end,
            hl = {
                fg = C.teal, -- only change, previously rosewater
                bg = C.mantle,
            },
            icon = " " .. "" .. " ",
        }

        require("feline").setup({
            components = components,
        })
    end,
}
