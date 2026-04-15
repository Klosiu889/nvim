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
