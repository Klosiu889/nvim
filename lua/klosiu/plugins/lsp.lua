local status_config, lsp = pcall(require, 'lspconfig')
if not status_config then
    print('Error: lspconfig not found')
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
    print('Error: mason not found')
    return
end

lsp_installer.setup({
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗',
            package_pending = " ",
            package_installed = "󰄳 ",
            package_uninstalled = " 󰚌",
        }
    }
})

local status_lsp_zero, lsp_zero = pcall(require, 'lsp-zero')
if not status_lsp_zero then
    print('Error: lsp-zero not found')
    return
end

lsp_zero.preset('recommended')
lsp_zero.setup()
