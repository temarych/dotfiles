---@type PluginConfig
return {
  source = "https://github.com/saghen/blink.cmp",
  dependencies = {
    "https://github.com/nvim-mini/mini.snippets",
  },
  version = { tag = "1.x" },
  setup = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<C-o>"] = { "show" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      snippets = { preset = "mini_snippets" },
    })
  end,
}
