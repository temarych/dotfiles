vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

local gs = require("gitsigns")

vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
