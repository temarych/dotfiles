---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini.ai",
  dependencies = {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  },
  setup = function()
    local MiniAi = require("mini.ai")

    local gen_spec = MiniAi.gen_spec

    MiniAi.setup({
      custom_textobjects = {
        f = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
      },
    })
  end,
}
