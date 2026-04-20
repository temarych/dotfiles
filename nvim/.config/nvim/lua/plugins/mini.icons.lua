---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini.icons",
  setup = function()
    local mini_icons = require("mini.icons")
    mini_icons.setup()
    mini_icons.mock_nvim_web_devicons()
  end
}
