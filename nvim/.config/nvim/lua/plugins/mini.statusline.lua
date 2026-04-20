---@type PluginConfig
return {
  source = "https://github.com/nvim-mini/mini.statusline",
  setup = function()
    local MiniStatusline = require("mini.statusline")

    MiniStatusline.setup({
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = math.huge })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })

          return MiniStatusline.combine_groups({
            { hl = mode_hl, strings = { mode:upper() } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diff } },
            { hl = "MiniStatuslineDiagnostics", strings = { diagnostics } },
            "%<",
            "%=",
            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          })
        end
      }
    })
  end
}
