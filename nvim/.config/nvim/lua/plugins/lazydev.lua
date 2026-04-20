---@type PluginConfig
return {
  source = "https://github.com/folke/lazydev.nvim",
  setup = function()
    require("lazydev").setup({
      integrations = {
        lspconfig = false
      }
    })
  end
}
