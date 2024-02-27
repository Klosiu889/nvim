return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup()

        vim.keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")
        vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>")
    end,
}
