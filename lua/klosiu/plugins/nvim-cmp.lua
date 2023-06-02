local status_lsp, lsp = pcall(require, 'lsp-zero')
if not status_lsp then
  return
end
lsp.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local status_cmp, cmp = pcall(require, 'cmp')
if not status_cmp then
  return
end


