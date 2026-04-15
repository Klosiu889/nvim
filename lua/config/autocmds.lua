-- Auto treesitter parser download and activation
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_magic", { clear = true }),
    callback = function(args)
        local buftype = vim.bo[args.buf].buftype
        if buftype ~= "" then
            return
        end

        local filetype = args.match
        if not filetype or filetype == "" then
            return
        end

        local lang = vim.treesitter.language.get_lang(filetype) or filetype
        local _, result = pcall(vim.treesitter.language.add, lang)

        if result == true then
            pcall(vim.treesitter.start, args.buf, lang)
        elseif result ~= nil then
            vim.notify("Downloading Treesitter parser for: " .. lang, vim.log.levels.INFO)
            vim.cmd("silent! TSInstall " .. lang)
            local timer = vim.uv.new_timer()
            local attempts = 0

            if timer == nil then
                return
            end

            timer:start(
                1000,
                1000,
                vim.schedule_wrap(function()
                    attempts = attempts + 1

                    local _, is_ready = pcall(vim.treesitter.language.add, lang)

                    if is_ready == true then
                        timer:stop()
                        timer:close()

                        if vim.api.nvim_buf_is_valid(args.buf) then
                            pcall(vim.treesitter.start, args.buf, lang)
                            vim.notify("Highlighting ready for: " .. lang, vim.log.levels.INFO)
                        end
                    elseif attempts >= 30 then
                        timer:stop()
                        timer:close()
                    end
                end)
            )
        end
    end,
})

-- Highlighting when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Java config
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function(args)
        require("jdtls.jdtls_setup").setup()

        local opts = { noremap = true, silent = true }
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
    end,
})
