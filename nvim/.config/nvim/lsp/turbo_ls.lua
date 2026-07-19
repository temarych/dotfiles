---@type vim.lsp.Config
return {
  cmd = { "turbo-language-server", "--stdio" },
  filetypes = { "html", "ruby", "eruby", "blade", "php" },
  root_markers = { "Gemfile", ".git" },
}
