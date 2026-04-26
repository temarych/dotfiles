local MiniIcons = require("mini.icons")

local M = {}

---@class TabInfo
---@field number integer
---@field file_name string

---@param tab_id integer
---@return TabInfo
function M.get_tab_info(tab_id)
  local win_id = vim.api.nvim_tabpage_get_win(tab_id)

  local buf_id = vim.api.nvim_win_get_buf(win_id)
  local buf_name = vim.api.nvim_buf_get_name(buf_id)

  local file_name = vim.fn.fnamemodify(buf_name, ":t")
  local number = vim.api.nvim_tabpage_get_number(tab_id)

  return {
    number = number,
    file_name = file_name,
  }
end

---@class Tab
---@field info TabInfo
---@field is_selected boolean

---@param tab Tab
function M.render_tab(tab)
  local hl = tab.is_selected and "TabLineSel" or "TabLine"

  local icon = MiniIcons.get("file", tab.info.file_name)
  local name = tab.info.file_name ~= "" and tab.info.file_name or "No name"

  return string.format("%%#%s#%d %s %s  ", hl, tab.info.number, icon, name)
end

function M.render()
  local tab_ids = vim.api.nvim_list_tabpages()
  local current_tab_id = vim.api.nvim_get_current_tabpage()

  local elements = {}

  for _, tab_id in ipairs(tab_ids) do
    local is_selected = tab_id == current_tab_id

    local info = M.get_tab_info(tab_id)
    local tab = { info = info, is_selected = is_selected }

    table.insert(elements, M.render_tab(tab))
  end

  table.insert(elements, "%#TabLineFill#")

  return table.concat(elements)
end

function M.setup()
  vim.o.tabline = "%!v:lua.require'tabline'.render()"
end

return M
