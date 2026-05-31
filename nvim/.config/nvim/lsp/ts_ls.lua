local paths = require("lib.paths")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = paths.get_cmd_path((config or {}).root_dir, "tsgo")
    return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
  end,
  settings = {},
  root_markers = { "package.json", "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}
