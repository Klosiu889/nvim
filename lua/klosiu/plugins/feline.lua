return {
    "feline-nvim/feline.nvim",
    config = function()
        local feline = require("feline")
        local C = require("catppuccin.palettes").get_palette()
        local ctp_feline = require("catppuccin.groups.integrations.feline")

        ctp_feline.setup({
            view = {
                lsp = {
                    name = true,
                },
            },
        })

        -- Making feline consistent with diagnostics colors
        local components = ctp_feline.get()
        components.active[2][5].hl.fg = C.teal

        feline.setup({
            components = components,
        })
    end,
}
