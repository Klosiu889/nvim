return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            transparent_background = true,
            auto_integrations = true,
        })

        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
