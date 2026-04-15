require("vim._core.ui2").enable()
if vim.loader then
    vim.loader.enable()
end

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.catppuccin")

require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.harpoon")

require("plugins.surround")
require("plugins.cloak")
require("plugins.lazygit")

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    callback = function()
        require("plugins.treesitter")
        require("plugins.lsp")
        require("plugins.jdtls")
        require("plugins.formatting")
        require("plugins.linting")
        require("plugins.trouble")
    end,
    once = true
})

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        require("plugins.cmp")
    end,
    once = true
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        require("plugins.markdown")
    end,
    once = true,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            require("plugins.which-key")
            require("plugins.tmux")
            require("plugins.gitsigns")
            require("plugins.colorizer")
            require("plugins.lualine")
        end)
    end,
    once = true
})
