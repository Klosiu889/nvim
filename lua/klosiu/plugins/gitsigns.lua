return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup()

        vim.keymap.set("n", "]c", function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gitsigns.nav_hunk("next")
            end
        end, { desc = "Gitsigns next hunk" })
        vim.keymap.set("n", "[c", function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gitsigns.nav_hunk("prev")
            end
        end, { desc = "Gitsigns previous hunk" })

        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Gitsigns stage hunk" })
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Gitsigns reset hunk" })
        vim.keymap.set("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Gitsigns stage hunk visual mode" })
        vim.keymap.set("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Gitsigns reset hunk visual mode" })
        vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Gitsigns stage buffer" })
        vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
        vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Gitsigns reset buffer" })
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Gitsigns preview hunk" })
        vim.keymap.set("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
        end, { desc = "Gitsigns blame line" })
        vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Gitsigns toggle line blame" })
        vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Gitsigns show diff" })
        vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle gitsigns deleted" })
    end,
}
