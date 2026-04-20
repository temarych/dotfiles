vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

---@type tokyonight.Config
local opts = {
  style = "night",
  transparent = true,
  on_colors = function() end,
  on_highlights = function() end,
}

---@module "tokyonight"
local tokyonight = require("tokyonight")

tokyonight.setup(opts)

vim.cmd[[colorscheme tokyonight]]
