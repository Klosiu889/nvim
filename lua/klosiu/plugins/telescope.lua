return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },

        config = function()
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--follow",
                        "--glob",
                        "!.git/",
                    },
                },
            })

            vim.keymap.set(
                "n",
                "<leader>ff",
                "<cmd>Telescope find_files<cr>",
                { desc = "Find files within current working directory, respects .gitignore" }
            )
            vim.keymap.set(
                "n",
                "<leader>fa",
                "<cmd>Telescope find_files hidden=true follow=true<cr>",
                { desc = "Find all files within current working directory, respects .gitignore" }
            )
            vim.keymap.set(
                "n",
                "<leader>fs",
                "<cmd>Telescope live_grep<cr>",
                { desc = "Find string in current working directory as you type" }
            )
            vim.keymap.set(
                "n",
                "<leader>fc",
                "<cmd>Telescope grep_string<cr>",
                { desc = "Find string under cursor in current working directory" }
            )
            vim.keymap.set(
                "n",
                "<leader>fb",
                "<cmd>Telescope buffers<cr>",
                { desc = "List open buffers in current neovim instance" }
            )
            vim.keymap.set(
                "n",
                "<leader>fi",
                "<cmd>Telescope current_buffer_fuzzy_find<cr>",
                { desc = "Find string in current file as you type" }
            )
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List available help tags" })
            vim.keymap.set("n", "<leader>fn", "<cmd>Telescope noice<cr>", { desc = "List noice messages" })
            vim.keymap.set(
                "n",
                "<leader>th",
                "<cmd>Telescope colorscheme<cr>",
                { desc = "List available colorschemes" }
            )
        end,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
