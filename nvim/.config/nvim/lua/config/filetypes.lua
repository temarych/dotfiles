vim.filetype.add({
  pattern = {
    [".*/%.config/tmux/.*%.conf"] = "tmux",
  },
})

vim.filetype.add({
  pattern = {
    [".*/%.gitconfig%.local"] = "gitconfig",
  },
})
