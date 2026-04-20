local resolver = require("manager.resolver")
local iterables = require("lib.iterables")

local M = {}

---@param version Version
local function create_version(version)
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
      version = config.version and create_version(config.version),
    }
  end)
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

---@param configs PluginConfig[]
local function run_setup_hooks(configs)
  for _, config in ipairs(configs) do
    if config.setup then
      config.setup()
    end
  end
end

---@param configs PluginConfig[]
function M.load_plugins(configs)
  vim.pack.add(create_specs(configs))
end

function M.update_plugins()
  vim.pack.update(nil, { force = true })
end

---@param configs PluginConfig[]
function M.clean_plugins(configs)
  local missing = get_missing_sources(configs)

  vim.pack.del(iterables.map(missing, function(data)
    return data.spec.name
  end))
end

---@param configs PluginConfig[]
function M.setup_plugins(configs)
  configs = resolver.sort_configs(configs)
  M.load_plugins(configs)
  run_setup_hooks(configs)
end

return M
