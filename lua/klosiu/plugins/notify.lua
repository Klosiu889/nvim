return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",

    config = function()
        local notify = require("notify")

        notify.setup({
            timeout = 3000,
            background_colour = "#000000",
            stages = "slide",
            fps = 60,
        })

        vim.keymap.set("n", "<leader>nt", "<cmd>Telescope notify<cr>")

        vim.notify = notify
    end,
}
