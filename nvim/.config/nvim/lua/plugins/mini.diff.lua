---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini.diff",
  setup = function()
    local MiniDiff = require("mini.diff")

    MiniDiff.setup({
      view = {
        style = "sign",
        signs = { add = "┃", change = "┃", delete = "┃" },
        priority = 199,
      },
      delay = {
        text_change = 10,
      },
      mappings = {
        apply = "gh",
        reset = "gH",
        textobject = "gh",
        goto_first = "[H",
        goto_prev = "[h",
        goto_next = "]h",
        goto_last = "]H",
      },
    })
  end,
}
