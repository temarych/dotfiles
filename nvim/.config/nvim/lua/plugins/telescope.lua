---@type PluginConfig
return {
  source = "https://github.com/nvim-telescope/telescope.nvim",
  dependencies = {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  },
  setup = function()
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { ".git" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fH", builtin.highlights, { desc = "Telescope highlights" })
  end,
}
