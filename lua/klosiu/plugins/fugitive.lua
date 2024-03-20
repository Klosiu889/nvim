return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gs", ":Git<CR>")
        vim.keymap.set("n", "<leader>gv", ":Gvdiff<CR>")
    end,
}
