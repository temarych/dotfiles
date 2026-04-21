local M = {}

---@param raw string
---@return string[]
function M.split_lines(raw)
  local lines = {} ---@type string[]

  for line in raw:gmatch("[^\n]+") do
    table.insert(lines, line)
  end

  local min_indent = math.huge

  for _, line in ipairs(lines) do
    local indent = line:match("^( *)") ---@type string
    min_indent = math.min(min_indent, #indent)
  end

  for i, line in ipairs(lines) do
    lines[i] = line:sub(min_indent + 1):gsub("%s+$", "")
  end

  return lines
end

---@param value string
---@return string?
function M.get_first_line(value)
  return value:match("^[^\n]+")
end

return M
