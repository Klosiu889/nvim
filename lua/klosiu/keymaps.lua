vim.g.mapleader = " "

vim.keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Disable highlights" })
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })
vim.keymap.set("n", "<leader>sn", "<C-w>w", { desc = "Go to next split window" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })
