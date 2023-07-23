local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "cuda",
        "dockerfile",
        "python",
        "html",
        "javascript",
        "json",
        "lua",
        "rust",
    },
    auto_install = true,
})
