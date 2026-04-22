local resolver = require("manager.resolver")
local iterables = require("lib.iterables")
local spec = require("manager.spec")

local M = {}

---@param configs PluginConfig[]
---@param plug_data vim.pack.PlugData[]
local function get_missing_sources(configs, plug_data)
  ---@type vim.pack.PlugData[]
  local missing = {}

  for _, data in ipairs(plug_data) do
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
  vim.pack.add(spec.create_specs(configs))
end

function M.update_plugins()
  vim.pack.update(nil, { force = true })
end

---@param configs PluginConfig[]
function M.clean_plugins(configs)
  local plug_data = vim.pack.get()

  local missing = get_missing_sources(configs, plug_data)

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
