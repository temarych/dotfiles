---@type string[]
local parsers = {
  "python",
  "markdown",
  "markdown_inline",
  "lua",
  "toml",
  "yaml",
  "json",
  "bash",
  "zsh",
  "tmux",
  "vimdoc",
  "query",
  "comment",
  "diff",
  "git_config",
  "dockerfile",
  "regex",
}

local function setup_treesitter_for_files()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
      local filetype = vim.bo.filetype
      local lang = vim.treesitter.language.get_lang(filetype)

      if not lang then
        return
      end

      if vim.treesitter.query.get(lang, "highlights") then
        vim.treesitter.start()
      end

      if vim.treesitter.query.get(lang, "folds") then
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldlevel = 99
      end

      if vim.treesitter.query.get(lang, "indents") then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
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
