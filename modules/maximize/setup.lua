require("maximize").setup()

vim.keymap.set("n", "<M-m>", function()
  require("maximize").toggle()
end, {
  desc = "Toggle Maximize Split",
})
