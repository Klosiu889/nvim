return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Fugitive git status" })
        vim.keymap.set("n", "<leader>gv", "<cmd>Gvdiff<CR>", { desc = "Fugitive git diff vertical" })
        vim.keymap.set("n", "<leader>gm", "<cmd>Gvdiffsplit!<CR>", { desc = "Fugitive git 3 way diff" })
    end,
}
