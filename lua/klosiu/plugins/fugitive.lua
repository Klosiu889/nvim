return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Fugitive git status" })
        vim.keymap.set("n", "<leader>gv", ":Gvdiff<CR>", { desc = "Fugitive git diff vertical" })
    end,
}
