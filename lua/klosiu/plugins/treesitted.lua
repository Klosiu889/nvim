return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "comment",
                "cpp",
                "css",
                "cuda",
                "dockerfile",
                "python",
                "html",
                "javascript",
                "json",
                "lua",
                "rust",
            },
            auto_install = true,
        })
    end,
}
