return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                lua = { "stylua" },
                python = { "ruff", "mypy" },
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
    end,
}
