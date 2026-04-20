local function configure_windows()
  vim.api.nvim_create_autocmd('User', {
    pattern = { 'MiniCompletionWindowOpen', 'MiniCompletionWindowUpdate' },
    callback = function(event)
      local win_id = event.data.win_id
      local config = vim.api.nvim_win_get_config(win_id)
      config.title = ""
      vim.api.nvim_win_set_config(win_id, config)
    end,
  })
end

---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini.completion",
  dependencies = {
    "https://github.com/nvim.mini/mini.icons"
  },
  setup = function()
    local MiniIcons = require("mini.icons")

    require("mini.completion").setup()
    MiniIcons.tweak_lsp_kind()

    configure_windows()
  end
}
