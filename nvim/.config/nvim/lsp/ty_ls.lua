---@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_dir = function(_, on_dir)
    local root_path = vim.fs.find("ty.toml", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    if not root_path then
      return
    end

    on_dir(vim.fn.fnamemodify(root_path, ":h"))
  end,
}
