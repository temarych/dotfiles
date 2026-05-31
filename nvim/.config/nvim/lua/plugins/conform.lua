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
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
        javascript = { "biome" },
        typescript = { "biome" },
        jsx = { "biome" },
        tsx = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        css = { "biome" },
      },
      formatters = {
        biome = {
          require_cwd = true,
        },
      },
    })
  end,
}
