local iterables = require("lib.iterables")

local M = {}

---@class VersionTag
---@field tag string

---@class VersionBranch
---@field branch string

---@alias Version VersionTag | VersionBranch

---@class PluginConfig
---@field source string
---@field build string?
---@field version Version?
---@field dependencies string[]?
---@field setup fun()?

local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

local function load_configs()
  ---@type PluginConfig[]
  local configs = {}

  for _, file in ipairs(vim.fn.glob(plugins_dir .. "/*.lua", true, true)) do
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

---@param version Version
local function resolve_version(version)
  if version.tag then
    return vim.version.range(version.tag)
  else
    return version.branch
  end
end

---@param configs PluginConfig[]
local function create_specs(configs)
  return iterables.map(configs, function(config)
    ---@type vim.pack.Spec
    return {
      src = config.source,
      build = config.build,
      version = config.version and resolve_version(config.version),
    }
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

---@param configs PluginConfig[]
local function get_missing_sources(configs)
  ---@type vim.pack.PlugData[]
  local missing = {}

  for _, data in ipairs(vim.pack.get()) do
    local config = iterables.find(configs, function(config)
      return config.source == data.spec.src
    end)

    if not config then
      table.insert(missing, data)
    end
  end

  return missing
end

function M.clean()
  local configs = load_configs()
  local missing = get_missing_sources(configs)

  vim.pack.del(iterables.map(missing, function(data)
    return data.spec.name
  end))
end

function M.setup()
  local configs = load_configs()
  configs = sort_configs(configs)
  vim.pack.add(create_specs(configs))
  setup_plugins(configs)
end

return M
