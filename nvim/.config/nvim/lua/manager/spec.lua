local iterables = require("lib.iterables")

local M = {}

---@param version Version
function M.create_version(version)
  if version.tag then
    return vim.version.range(version.tag)
  else
    return version.branch
  end
end

---@param configs PluginConfig[]
function M.create_specs(configs)
  return iterables.map(configs, function(config)
    ---@type vim.pack.Spec
    return {
      src = config.source,
      build = config.build,
      version = config.version and M.create_version(config.version),
    }
  end)
end

return M
