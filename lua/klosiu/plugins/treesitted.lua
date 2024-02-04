return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,

    config = function()
        require('nvim-treesitter.configs').setup({
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
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
    end
}
