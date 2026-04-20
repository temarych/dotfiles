local M = {}

---@generic T
---@param t T[]
---@param fn fun(v: T): boolean
---@return T?
function M.find(t, fn)
  for _, v in ipairs(t) do
    if fn(v) then return v end end
end

---@generic T, U
---@param t T[]
---@param fn fun(v: T): U
---@return U[]
function M.map(t, fn)
  local result = {}
  for _, v in ipairs(t) do
    table.insert(result, fn(v)) end
  return result
end

return M
