local function enable_lsps()
  vim.lsp.enable("lua_ls")
  vim.lsp.enable("json_ls")
  vim.lsp.enable("yaml_ls")
  vim.lsp.enable("toml_ls")
  vim.lsp.enable("ty_ls")
  vim.lsp.enable("ruff_ls")
  vim.lsp.enable("pyright_ls")
  vim.lsp.enable("ts_ls")
  vim.lsp.enable("biome_ls")
  vim.lsp.enable("css_ls")
  vim.lsp.enable("cssmodules_ls")
  vim.lsp.enable("eslint_ls")
  vim.lsp.enable("svelte_ls")
  vim.lsp.enable("terraform_ls")
end

local function override_lsp_config()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if not client then
        return
      end

      client.server_capabilities.semanticTokensProvider = nil
    end,
  })
end

local function setup_keymaps()
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
end

enable_lsps()
override_lsp_config()
setup_keymaps()
