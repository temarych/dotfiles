---@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_dir = function(_, on_dir)
    local ty_path = vim.fs.find("ty.toml", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    local root_path = vim.fs.find("pyproject.toml", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    if not ty_path then
      return
    end

    if not root_path then
      return on_dir()
    end

    on_dir(vim.fn.fnamemodify(root_path, ":h"))
  end,
}
