vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

require("tokyonight").setup({
  style = "night",
  transparent = true,
  on_colors = function() end,
  on_highlights = function() end,
})

vim.cmd[[colorscheme tokyonight]]
