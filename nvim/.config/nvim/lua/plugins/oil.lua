---@type PluginConfig
return {
  source = "https://github.com/stevearc/oil.nvim",
  setup = function()
    require("oil").setup({
      view_options = {
        show_hidden = true
      }
    })

    vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, { desc = "Open file explorer" })
  end
}
