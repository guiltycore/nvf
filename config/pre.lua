vim.api.nvim_create_autocmd("VimEnter", {
  command = "silent !kitty @ set-spacing padding=0 margin=0"
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  command = "silent !kitty @ set-spacing padding=25" -- Adjust values to your default
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if vim.t.maximized then
			require("maximize").restore()
		end
	end,
})
