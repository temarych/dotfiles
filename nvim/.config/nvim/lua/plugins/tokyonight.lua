---@param hl tokyonight.Highlights
---@param c ColorScheme
local function setup_telescope_highlights(hl, c)
  hl.TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float }
  hl.TelescopeTitle = { fg = c.dark5, bg = c.bg_float }

  hl.TelescopePromptBorder = { fg = c.border_highlight, bg = c.bg_float }
  hl.TelescopePromptTitle = { fg = c.dark5, bg = c.bg_float }
end

---@param hl tokyonight.Highlights
---@param c ColorScheme
local function setup_tabline_highlights(hl, c)
  hl.TabLine = { fg = c.dark5, bg = "NONE" }
  hl.TabLineSel = { fg = c.blue, bg = "NONE" }
  hl.TabLineFill = { bg = "NONE" }
end

---@param hl tokyonight.Highlights
---@param c ColorScheme
local function setup_alpha_highlights(hl, c)
  hl.AlphaButtons = { fg = c.fg, bg = "NONE" }
  hl.AlphaButtonIcons = { fg = c.blue5, bg = "NONE" }
  hl.AlphaHeader = { fg = c.blue1, bg = "NONE" }
  hl.AlphaShortcut = { fg = c.orange, bg = "NONE" }
end

---@param hl tokyonight.Highlights
---@param c ColorScheme
local function setup_pmenu_highlights(hl, c)
  hl.PmenuExtra = { fg = c.fg, bg = "NONE" }
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
        c.border = c.fg_gutter
        c.border_highlight = c.fg_gutter
      end,
      on_highlights = function(hl, c)
        setup_telescope_highlights(hl, c)
        setup_tabline_highlights(hl, c)
        setup_alpha_highlights(hl, c)
        setup_pmenu_highlights(hl, c)
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end,
}
