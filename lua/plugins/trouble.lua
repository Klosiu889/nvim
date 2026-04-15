vim.pack.add({
    "https://github.com/folke/trouble.nvim",
})

local trouble = require("trouble")

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle trouble menu" })
vim.keymap.set("n", "<leader>[t", function()
    trouble.previous({ skip_groups = true, jump = true })
end, { desc = "Trouble previous" })
vim.keymap.set("n", "<leader>]t", function()
    trouble.next({ skip_groups = true, jump = true })
end, { desc = "Trouble next" })

trouble.setup({
    signs = {
        error = "",
        warning = "",
        hint = "󰠠",
        information = "",
        other = "",
    },
    focus = true,
})
