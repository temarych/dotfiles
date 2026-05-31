local paths = require("lib.paths")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = paths.get_cmd_path((config or {}).root_dir, "vscode-eslint-language-server")
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "astro",
    "htmlangular",
  },
  root_markers = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "eslint.config.ts",
    "eslint.config.mts",
    "eslint.config.cts",
  },
  workspace_required = true,
  settings = {
    validate = "on",
    run = "onType",
    ---@diagnostic disable-next-line: assign-type-mismatch
    packageManager = nil,
    nodePath = "",
    useESLintClass = false,
    experimental = {},

    quiet = false,
    onIgnoredFiles = "off",
    rulesCustomizations = {},

    problems = {
      shortenToSingleLine = false,
    },

    format = false,

    codeActionOnSave = {
      enable = false,
      mode = "all",
    },

    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },

    workingDirectory = {
      mode = "auto",
    },
  },
  before_init = function(_, config)
    local root_dir = config.root_dir

    if not root_dir then
      return
    end

    config.settings = config.settings or {}

    config.settings.workspaceFolder = {
      uri = root_dir,
      name = vim.fn.fnamemodify(root_dir, ":t"),
    }
  end,
}
