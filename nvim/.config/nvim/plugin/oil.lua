vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

---@type oil.SetupOpts
local opts = {
  view_options = {
    show_hidden = true
  }
}

---@module "oil"
local oil = require("oil")

oil.setup(opts)
