vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>nh', ':nohl<CR>')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', 'dl', 'd$')

vim.keymap.set('n', '<leader>+', '<C-a>')
vim.keymap.set('n', '<leader>-', '<C-x>')

vim.keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width 
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window
vim.keymap.set('n', '<leader>sn', '<C-w>w') -- go to next split window

vim.keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>') -- go to next tab 
vim.keymap.set('n', '<leader>tp', ':tabp<CR>') -- go to previous tab

