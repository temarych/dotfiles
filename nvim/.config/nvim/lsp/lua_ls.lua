return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
    },
  },
}
