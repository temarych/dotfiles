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
  root_dir = function(bufnr, on_dir)
    local root_markers = {
      "package-lock.json",
      "yarn.lock",
      "pnpm-lock.yaml",
      "bun.lockb",
      "bun.lock",
      "deno.lock",
    }

    local biome_config_files = { "biome.json", "biome.jsonc" }

    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    local filename = vim.api.nvim_buf_get_name(bufnr)

    local biome_path = vim.fs.find(biome_config_files, {
      path = filename,
      type = "file",
      limit = 1,
      upward = true,
      stop = vim.fs.dirname(project_root),
    })[1]

    if not biome_path then
      return
    end

    on_dir(project_root)
  end,
}
