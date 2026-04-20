---@type PluginConfig
return {
  source = "https://github.com/folke/tokyonight.nvim",
  setup = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      on_colors = function() end,
      on_highlights = function() end,
    })

    vim.cmd.colorscheme("tokyonight")

    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none', fg = 'none' })
  end
}
