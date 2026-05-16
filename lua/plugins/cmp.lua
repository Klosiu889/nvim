vim.pack.add({
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/onsails/lspkind.nvim",
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    completion = {
        completeopt = "fuzzy,menu,menuone,preview,noselect",
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    window = {
        documentation = cmp.config.window.bordered({
            border = "rounded",
        }),
        completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        }),
    },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'c' }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'c' }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'c' }),
        ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { 'c' }),
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'c' }),
    }),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
