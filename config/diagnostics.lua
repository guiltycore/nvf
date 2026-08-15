local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = " ",
  [vim.diagnostic.severity.WARN] = " ",
  [vim.diagnostic.severity.HINT] = " ",
  [vim.diagnostic.severity.INFO] = " ",
}

vim.diagnostic.config({
  underline = false,
  update_in_insert = false,
  severity_sort = true,

  virtual_text = {
    spacing = 1,
    source = false,
    prefix = "",
    format = function(diagnostic)
      return diagnostic_icons[diagnostic.severity]
    end,
  },

  virtual_lines = {
    current_line = true,
    format = function(diagnostic)
      return ("%s %s: %s [%s]"):format(
        diagnostic_icons[diagnostic.severity],
        diagnostic.source,
        diagnostic.message,
        diagnostic.code
      )
    end,
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})
