local strings = require("lib.strings")
local logo = require("assets.logo")

---@class ButtonProps
---@field icon string
---@field label string
---@field shortcut string
---@field command string
---@field width integer

---@param props ButtonProps
local function create_button(props)
  local opts = {
    position = "center",
    shortcut = props.shortcut,
    width = props.width,
    cursor = 3,
    align_shortcut = "right",
    hl = { { "AlphaButtonIcons", 0, 1 }, { "AlphaButtons", 1, #props.label } },
    hl_shortcut = "AlphaShortcut",
    keymap = { "n", props.shortcut, "<cmd>" .. props.command .. "<CR>", { noremap = true, silent = true } },
  }

  local handle_press = function()
    local key = vim.api.nvim_replace_termcodes(props.shortcut, true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = props.icon .. "  " .. props.label,
    opts = opts,
    on_press = handle_press,
  }
end

---@param logo_lines string[]
local function create_header(logo_lines)
  return {
    type = "text",
    val = logo_lines,
    opts = {
      position = "center",
      hl = "AlphaHeader",
    },
  }
end

---@param width integer
local function create_menu(width)
  return {
    type = "group",
    val = {
      create_button({
        icon = "",
        label = "New file",
        shortcut = "e",
        command = "ene | startinsert",
        width = width,
      }),
      create_button({
        icon = "",
        label = "Plugins",
        shortcut = "p",
        command = "cd ~/.config/nvim | e lua/plugins",
        width = width,
      }),
      create_button({
        icon = "",
        label = "Configuration",
        shortcut = "c",
        command = "cd ~/.config/nvim | e .",
        width = width,
      }),
    },
    opts = {
      spacing = 1,
    },
  }
end

---@param list string[]
---@return integer
local function get_max_width(list)
  return math.max(unpack(vim.tbl_map(function(str)
    return #str
  end, list)))
end

local function create_config()
  local logo_lines = strings.split_lines(logo)
  local width = get_max_width(logo_lines)

  local padding = 5
  local gap = 2

  return {
    layout = {
      {
        type = "group",
        opts = { position = "v_center" },
        val = {
          { type = "padding", val = padding },
          create_header(logo_lines),
          { type = "padding", val = gap },
          create_menu(width),
          { type = "padding", val = padding },
        },
      },
    },
    opts = {
      margin = padding,
    },
  }
end

---@type PluginConfig
return {
  source = "https://github.com/goolord/alpha-nvim",
  setup = function()
    local config = create_config()
    require("alpha").setup(config)
  end,
}
