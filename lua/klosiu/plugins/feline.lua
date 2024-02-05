return {
    "feline-nvim/feline.nvim",
    config = function()
        require("feline").setup({
            components = require("catppuccin.groups.integrations.feline").get(),
        })
    end,
}
