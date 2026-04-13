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
        else
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
