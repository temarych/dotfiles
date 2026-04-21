local strings = require("lib.strings")

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    format = function(diagnostic)
      return strings.get_first_line(diagnostic.message)
    end,
  },
  severity_sort = true,
})
