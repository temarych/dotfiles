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

        hl.FloatBorder = { bg = 'none', fg = '#414868' }
        hl.PmenuBorder = hl.FloatBorder

        hl.Pmenu = { bg = 'none' }
        hl.PmenuMatch = { bg = 'none', fg = hl.PmenuMatch.fg }
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end
}
