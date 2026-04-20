---@type PluginConfig
return {
  source = "https://github.com/nvim-lualine/lualine.nvim",
  dependencies = {
    "https://github.com/folke/tokyonight.nvim",
  },
  setup = function()
    local theme = require('lualine.themes.auto')

    theme.normal.c.bg = "none"

    require("lualine").setup({
      options = {
        theme = theme,
      },
    })
  end
}
