return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", { desc = "Toggle undotree" })
    end,
}
