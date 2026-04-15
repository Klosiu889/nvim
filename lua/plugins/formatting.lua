vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
    formatters_by_ft = {
        javascript = { "eslint_d", "prettier" },
        typescript = { "eslint_d", "prettier" },
        javascriptreact = { "eslint_d", "prettier" },
        typescriptreact = { "eslint_d", "prettier", lsp_fallback = true },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        -- python = { "ruff", "mypy" },
        cpp = { "clang-format" },
        c = { "clang-format" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout = 500,
    },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout = 500,
    })
end, { desc = "Format file or range" })
