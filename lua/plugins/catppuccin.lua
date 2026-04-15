vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

require("catppuccin").setup({
    transparent_background = true,
    auto_integrations = true
})

vim.cmd.colorscheme("catppuccin-mocha")
