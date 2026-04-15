vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/j-hui/fidget.nvim",
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local fidget = require("fidget")

mason.setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
            package_pending = " ",
            package_installed = "󰄳 ",
            package_uninstalled = " 󰚌",
        },
        border = "rounded",
    },
})

mason_lspconfig.setup({
    automatic_enable = {
        exclude = {
            "jdtls",
        },
    },
})

fidget.setup({
    notification = {
        window = {
            windblend = 0,
            border = "rounded",
        },
    },
})

fidget.setup()

local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "Show LSP implementations"
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Restart LSP"
    vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

    opts.desc = "Function signature help"
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local default_settings_servers = mason_lspconfig.get_installed_servers()
for _, v in ipairs(default_settings_servers) do
    if v ~= "jdtls" then
        vim.lsp.config(v, {
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

vim.lsp.config("ltex", {
    settings = {
        ltex = {
            language = "pl-PL",
        },
    },
})
