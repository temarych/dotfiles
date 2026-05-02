local paths = require("lib.paths")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = paths.get_cmd_path((config or {}).root_dir, "biome")
    return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
  end,
  filetypes = {
    "astro",
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "svelte",
    "typescript",
    "typescriptreact",
    "vue",
  },
  workspace_required = true,
  root_markers = { "biome.json" },
}
