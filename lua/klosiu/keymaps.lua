vim.g.mapleader = " "

vim.keymap.set("n", "<ESC>", "<cmd>nohl<CR>", { desc = "Disable highlights" })
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("v", "J", "<ESC><cmd>'<,'>m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", "<ESC><cmd>'<,'>m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })
vim.keymap.set("n", "<leader>sn", "<C-w>w", { desc = "Go to next split window" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

local function coerce_to(style)
    local old_name = vim.fn.expand("<cword>")
    if old_name == "" then
        return
    end

    local parts = {}
    for part in old_name:gmatch("([%a%d]+)") do
        local sub_parts = part:gsub("(%l)(%u)", "%1 %2"):gsub("(%u)(%u%l)", "%1 %2")
        for word in sub_parts:gmatch("%S+") do
            table.insert(parts, word:lower())
        end
    end

    local new_name = ""
    if style == "snake" then
        new_name = table.concat(parts, "_")
    elseif style == "kebab" then
        new_name = table.concat(parts, "-")
    elseif style == "camel" then
        for i, word in ipairs(parts) do
            if i == 1 then
                new_name = word
            else
                new_name = new_name .. word:sub(1, 1):upper() .. word:sub(2)
            end
        end
    elseif style == "pascal" then
        for _, word in ipairs(parts) do
            new_name = new_name .. word:sub(1, 1):upper() .. word:sub(2)
        end
    end

    if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
        vim.lsp.buf.rename(new_name)
    else
        vim.cmd("normal! ciw" .. new_name)
    end
end
vim.keymap.set("n", "<leader>cs", function()
    coerce_to("snake")
end, { desc = "Rename variable to snake case" })
vim.keymap.set("n", "<leader>cc", function()
    coerce_to("camel")
end, { desc = "Rename variable to camel case" })
vim.keymap.set("n", "<leader>cp", function()
    coerce_to("pascal")
end, { desc = "Rename variable to pascal case" })
vim.keymap.set("n", "<leader>ck", function()
    coerce_to("kebab")
end, { desc = "Rename variable to kebab case" })

vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

vim.keymap.set("v", "<Up>", "<nop>")
vim.keymap.set("v", "<Down>", "<nop>")
vim.keymap.set("v", "<Left>", "<nop>")
vim.keymap.set("v", "<Right>", "<nop>")

vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")
