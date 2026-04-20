---@type PluginConfig
return {
  source = "https://github.com/folke/tokyonight.nvim",
  setup = function()
    require("tokyonight").setup({
      style = "night",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      transparent = true,
      on_colors = function() end,
      on_highlights = function(hl)
        hl.StatusLine = { bg = 'none', fg = 'none' }
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end
}
