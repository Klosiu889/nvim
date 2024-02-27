return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>g", ":Git<CR>")
        vim.keymap.set("n", "<leader>gv", ":Gvdiff<CR>")
    end,
}
