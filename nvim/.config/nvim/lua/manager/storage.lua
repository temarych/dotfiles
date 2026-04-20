local M = {}

---@param dir string
function M.load_configs(dir)
  ---@type PluginConfig[]
  local configs = {}

  for _, file in ipairs(vim.fn.glob(dir .. "/*.lua", true, true)) do
    ---@type PluginConfig
    local config = dofile(file)
    table.insert(configs, config)
  end

  return configs
end

return M
