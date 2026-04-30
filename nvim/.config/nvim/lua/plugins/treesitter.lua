---@type string[]
local parsers = {
  "python",
  "markdown",
  "markdown_inline",
}

---@type string[]
local filetypes = {
  "python",
  "markdown",
}

local function setup_treesitter_for_files()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
      vim.treesitter.start()

      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
      vim.wo[0][0].foldlevel = 99

      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

---@type PluginConfig
return {
  source = "https://github.com/nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  setup = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup()
    treesitter.install(parsers)

    setup_treesitter_for_files()
  end,
}
