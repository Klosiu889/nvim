vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        vim.pack.add({
            "https://github.com/mfussenegger/nvim-jdtls",
        })
        require("jdtls.jdtls_setup").setup({})
    end,
})
