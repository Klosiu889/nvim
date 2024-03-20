return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { desc = "Toggle undotree" })
    end,
}
