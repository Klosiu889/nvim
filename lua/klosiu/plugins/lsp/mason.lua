return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },

    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup({
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

        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "lua_ls",
                "clangd",
                "pyright",
                "rust_analyzer",
            },

            automatic_servers_installation = true,
        })
    end
}
