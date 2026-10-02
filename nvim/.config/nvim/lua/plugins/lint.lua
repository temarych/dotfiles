---@type PluginConfig
return {
  source = "https://codeberg.org/mfussenegger/nvim-lint.git",
  setup = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      swift = { "swiftlint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
