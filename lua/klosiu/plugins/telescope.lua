return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },

        config = function()
            vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
            vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
            vim.keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
            vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
            vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags
            vim.keymap.set('n', '<leader>th', '<cmd>Telescope colorscheme<cr>') -- list available colorschemes
        end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
}
