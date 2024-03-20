local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("klosiu.vim-options")
require("klosiu.keymaps")
require("lazy").setup({
    { import = "klosiu.plugins" },
    { import = "klosiu.plugins.lsp" },
}, {
    change_detection = {
        notify = false,
    },
})
