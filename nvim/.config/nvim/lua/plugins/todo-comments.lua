---@type PluginConfig
return {
  source = "https://github.com/folke/todo-comments.nvim",
  dependencies = {
    "https://github.com/nvim-lua/plenary.nvim",
  },
  setup = function()
    require("todo-comments").setup()
  end,
}
