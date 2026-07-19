local paths = require("lib.paths")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = paths.get_cmd_path((config or {}).root_dir, "svelteserver")
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "svelte" },
  root_markers = {
    "package-lock.json",
    "yarn.lock",
    "pnpm-lock.yaml",
    "bun.lockb",
    "bun.lock",
    "deno.lock",
  },
}
