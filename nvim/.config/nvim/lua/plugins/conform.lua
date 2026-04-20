---@type PluginConfig
return {
  source = "https://github.com/stevearc/conform.nvim",
  setup = function()
    local conform = require("conform")

    conform.setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
      },
    })
  end,
}
