vim.lsp.enable("lua_ls")
vim.lsp.enable("json_ls")
vim.lsp.enable("yaml_ls")

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
