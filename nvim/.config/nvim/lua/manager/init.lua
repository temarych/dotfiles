local iterables = require("lib.iterables")

local M = {}

---@class PluginConfig
---@field source string 
---@field build string?
---@field dependencies string[]?
---@field setup fun()?

local function load_configs()
  ---@type PluginConfig[]
  local configs = {}

  for _, file in ipairs(vim.fn.glob(vim.fn.stdpath('config')..'/lua/plugins/*.lua', true, true)) do
    ---@type PluginConfig
    local config = dofile(file)
    table.insert(configs, config)
  end

  return configs
end

---@param configs PluginConfig[]
local function create_config_index(configs)
  ---@type table<string, PluginConfig>
  local map = {}

  for _, config in ipairs(configs) do
    map[config.source] = config
  end

  return map
end

---@param configs PluginConfig[]
local function create_specs(configs)
  return iterables.map(configs, function(config)
    ---@type vim.pack.Spec
    return { src = config.source, build = config.build }
  end)
end

---@param configs PluginConfig[]
local function setup_plugins(configs)
  for _, config in ipairs(configs) do
    if config.setup then
      config.setup()
    end
  end
end

---@param configs PluginConfig[]
local function sort_configs(configs)
  ---@type PluginConfig[]
  local result = {}

  ---@type table<string, boolean>
  local seen = {}

  local index = create_config_index(configs)

  ---@param config PluginConfig 
  local function visit(config)
    if seen[config.source] then return end

    seen[config.source] = true

    for _, dep in ipairs(config.dependencies or {}) do
      local dep_config = index[dep]
      if dep_config then visit(dep_config) end
    end

    table.insert(result, config)
  end

  for _, config in ipairs(configs) do
    visit(config)
  end

  return result
end

function M.setup()
  local configs = load_configs()
  configs = sort_configs(configs)
  vim.pack.add(create_specs(configs))
  setup_plugins(configs)
end

return M
