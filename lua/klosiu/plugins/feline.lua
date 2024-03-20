return {
    "feline-nvim/feline.nvim",
    config = function()
        local C = require("catppuccin.palettes").get_palette()
        local ctp_feline = require("catppuccin.groups.integrations.feline")

        -- Making feline consistent with diagnostics colors
        local components = ctp_feline.get()
        components.active[2][5].hl.fg = C.teal

        require("feline").setup({
            components = components,
        })
    end,
}
