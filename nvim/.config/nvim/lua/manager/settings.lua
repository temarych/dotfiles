local M = {}

---@type Opts?
local _opts = nil

---@param opts Opts
function M.setup(opts)
  _opts = opts
end

function M.get()
  return _opts
end

return M
