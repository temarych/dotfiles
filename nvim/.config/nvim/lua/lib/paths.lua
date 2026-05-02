local M = {}

---@param root_dir string
---@param cmd string
function M.get_cmd_path(root_dir, cmd)
  if root_dir then
    local local_cmd = vim.fs.joinpath(root_dir, "node_modules/.bin", cmd)
    if vim.fn.executable(local_cmd) == 1 then
      cmd = local_cmd
    end
  end

  return cmd
end

return M
