return {
    "folke/trouble.nvim",

    config = function()
        local trouble = require("trouble")

        vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>")
        vim.keymap.set("n", "<leader>[t", function()
            trouble.previous({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "<leader>]t", function()
            trouble.next({ skip_groups = true, jump = true })
        end)

        trouble.setup({
            signs = {
                error = "",
                warning = "",
                hint = "󰠠",
                information = "",
                other = "",
            },
        })
    end,
}
