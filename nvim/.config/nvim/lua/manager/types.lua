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

---@class Opts
---@field config_dir string
