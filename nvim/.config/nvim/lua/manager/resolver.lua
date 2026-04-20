local M = {}

---@param configs PluginConfig[]
function M.create_config_index(configs)
  ---@type table<string, PluginConfig>
  local map = {}

  for _, config in ipairs(configs) do
    map[config.source] = config
  end

  return map
end

---@param configs PluginConfig[]
function M.sort_configs(configs)
  ---@type PluginConfig[]
  local result = {}

  ---@type table<string, boolean>
  local seen = {}

  local index = M.create_config_index(configs)

  ---@param config PluginConfig
  local function visit(config)
    if seen[config.source] then
      return
    end

    seen[config.source] = true

    for _, dep in ipairs(config.dependencies or {}) do
      local dep_config = index[dep]

      if not dep_config then
        error("Dependency should have a corresponding config file: " .. dep)
      end

      visit(dep_config)
    end

    table.insert(result, config)
  end

  for _, config in ipairs(configs) do
    visit(config)
  end

  return result
end

return M
