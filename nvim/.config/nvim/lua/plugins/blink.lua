---@type PluginConfig
return {
  source = 'https://github.com/saghen/blink.cmp',
  dependencies = {
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/rafamadriz/friendly-snippets',
  },
  version = '1.x',
  setup = function()
    require("blink.cmp").setup({
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })

    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
  end
}
