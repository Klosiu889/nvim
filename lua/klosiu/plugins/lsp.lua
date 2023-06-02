local status, lsp = pcall(require, 'lspconfig')
if not status then
  return
end

lsp.clangd.setup ({
  on_attach = on_attach,
  compatibilities = compatibilities,
  cmd = {
    "clangd",
    "-compile-commands-dir=/Users/klosiu/.config/nvim/lua/klosiu/plugins/lsp"
  }
})
