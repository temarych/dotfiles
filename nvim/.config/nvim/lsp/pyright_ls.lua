---@type vim.lsp.Config
return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = function(_, on_dir)
    local root_path = vim.fs.find("pyproject.toml", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    local ty_path = vim.fs.find("ty.toml", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    if ty_path then
      return
    end

    if not root_path then
      return on_dir()
    end

    on_dir(vim.fn.fnamemodify(root_path, ":h"))
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
