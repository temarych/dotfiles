---@param hl tokyonight.Highlights
---@param c ColorScheme
local function setup_telescope_highlights(hl, c)
  hl.TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float }
  hl.TelescopeTitle = { fg = c.fg, bg = c.bg_float }

  hl.TelescopePromptBorder = { fg = c.border_highlight, bg = c.bg_float }
  hl.TelescopePromptTitle = { fg = c.fg, bg = c.bg_float }
end

---@param hl tokyonight.Highlights
---@param c ColorScheme
local function setup_tabline_highlights(hl, c)
  hl.TabLine = { fg = c.dark5, bg = "NONE" }
  hl.TabLineSel = { fg = c.blue, bg = "NONE" }
  hl.TabLineFill = { bg = "NONE" }
end

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
      on_colors = function(c)
        c.bg_statusline = nil
        c.border_highlight = c.fg_gutter
      end,
      on_highlights = function(hl, c)
        setup_telescope_highlights(hl, c)
        setup_tabline_highlights(hl, c)
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end,
}
