---@param root_dir string
local function get_ts_compiler_path(root_dir)
  local cmd = "tsgo"

  if root_dir then
    local local_cmd = vim.fs.joinpath(root_dir, "node_modules/.bin", cmd)
    if vim.fn.executable(local_cmd) == 1 then
      cmd = local_cmd
    end
  end

  return cmd
end

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = get_ts_compiler_path((config or {}).root_dir)
    return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
  end,
  settings = {},
  root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}
