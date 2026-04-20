---@type PluginConfig
return {
  source = "https://github.com/lewis6991/gitsigns.nvim",
  setup = function()
    local gs = require("gitsigns")
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
  end
}
