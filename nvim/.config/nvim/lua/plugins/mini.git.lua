---@param args vim.api.keyset.create_autocmd.callback_args
local function format_summary(args)
  local summary = vim.b[args.buf].minigit_summary
  vim.b[args.buf].minigit_summary_string = summary.head_name or ""
end

local function setup_summary_format()
  local opts = { pattern = "MiniGitUpdated", callback = format_summary }
  vim.api.nvim_create_autocmd("User", opts)
end

---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini-git",
  setup = function()
    require("mini.git").setup()

    vim.keymap.set({ "n", "x" }, "<Leader>gs", MiniGit.show_at_cursor, { desc = "Show at cursor" })

    setup_summary_format()
  end,
}
