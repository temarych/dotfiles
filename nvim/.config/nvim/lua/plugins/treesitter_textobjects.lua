---@type PluginConfig
return {
  source = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "https://github.com/nvim-treesitter/nvim-treesitter",
  },
  setup = function()
    vim.g.no_plugin_maps = true
  end,
}
