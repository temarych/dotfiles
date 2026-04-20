---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini.snippets",
  dependencies = {
    "https://github.com/rafamadriz/friendly-snippets",
  },
  setup = function()
    local MiniSnippets = require("mini.snippets")

    local gen_loader = MiniSnippets.gen_loader

    MiniSnippets.setup({
      snippets = {
        gen_loader.from_file("~/.config/nvim/snippets/global.json"),
        gen_loader.from_lang(),
      },
    })
  end,
}
