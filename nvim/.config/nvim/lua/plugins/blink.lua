---@type PluginConfig
return {
  source = "https://github.com/saghen/blink.cmp",
  dependencies = {
    "https://github.com/rafamadriz/friendly-snippets",
  },
  version = { tag = "1.x" },
  setup = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<C-j>"] = { "show" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end,
}
