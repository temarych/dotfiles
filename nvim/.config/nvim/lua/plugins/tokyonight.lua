---@param hl table<string, string|tokyonight.Highlight>
local function setup_blink_highlights(hl)
  hl.BlinkCmpMenuBorder = hl.FloatBorder
  hl.BlinkCmpDocBorder = hl.FloatBorder
end

---@param hl table<string, string|tokyonight.Highlight>
local function setup_telescope_highlights(hl)
  hl.TelescopeBorder = hl.FloatBorder
  hl.TelescopePromptBorder = hl.FloatBorder

  hl.TelescopePromptTitle = hl.Normal
  hl.TelescopePreviewTitle = hl.Normal
  hl.TelescopeResultsTitle = hl.Normal
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
      on_colors = function() end,
      on_highlights = function(hl)
        hl.StatusLine = { bg = "none", fg = "none" }

        hl.FloatBorder = { bg = "none", fg = "#414868" }
        hl.PmenuBorder = hl.FloatBorder

        hl.Pmenu = { bg = "none" }
        hl.PmenuMatch = { bg = "none", fg = hl.PmenuMatch.fg }

        setup_blink_highlights(hl)
        setup_telescope_highlights(hl)
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end,
}
