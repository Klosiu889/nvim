local status_config, lsp = pcall(require, 'lspconfig')
if not status_config then
  return
end

lsp.clangd.setup ({
  cmd = {
    'clangd',
    '-compile-commands-dir=/Users/klosiu/.config/nvim/lua/klosiu/plugins/lsp'
  }
})

local status_installer, lsp_installer = pcall(require, 'mason')
if not status_installer then
  print('Error')
end

lsp_installer.setup({
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗'
        }
    }
})
