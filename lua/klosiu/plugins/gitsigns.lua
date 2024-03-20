return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup()

        vim.keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle gitsigns deleted" })
        vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Gitsigns next hunk" })
        vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Gitsigns previous hunk" })
    end,
}
