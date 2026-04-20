local M = {}

local settings = require("manager.settings")
local runner = require("manager.runner")
local storage = require("manager.storage")

function M.load_configs()
  local opts = settings.get()
  return storage.load_configs(opts.config_dir)
end

function M.update_plugins()
  runner.update_plugins()
end

function M.clean_plugins()
  local configs = M.load_configs()
  runner.clean_plugins(configs)
end

function M.setup_plugins()
  local configs = M.load_configs()
  runner.setup_plugins(configs)
end

local function create_user_commands()
  vim.api.nvim_create_user_command("PluginUpdate", M.update_plugins, {})
  vim.api.nvim_create_user_command("PluginClean", M.clean_plugins, {})
end

---@param opts Opts
function M.setup(opts)
  settings.setup(opts)
  create_user_commands()
  M.setup_plugins()
end

return M
