local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
  win = "TabLine",
  tail = "TabLine",
}

require("tabby").setup({
  line = require("tabby.presets").tab_only,
})

vim.notify("tabby configured")
