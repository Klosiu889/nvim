-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- mouse
vim.opt.mouse = "a"

vim.opt.iskeyword:append("-")

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 500

-- Save undo history
vim.opt.undofile = true

-- Highlighting when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- latex
vim.g.tex_flavor = "latex"
