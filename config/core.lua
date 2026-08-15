
vim.o.foldmethod = "expr"

-- vim.o.foldmethod = "indent"

-- vim.o.foldmethod = "manual"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

--opt.iskeyword:append("-")
vim.opt.iskeyword:remove("_")

-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos" -- this default
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,globals"
-- vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

-- vim.o.hlsearch = false
-- opt.hlsearch = true
-- opt.incsearch = true
--

vim.o.conceallevel = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java", "lua", "yaml", "json" },
	callback = function()
		-- vim.opt_local.number = false
		-- vim.opt_local.relativenumber = false
		-- vim.opt_local.cursorline = false
		-- vim.opt_local.softtabstop = 1
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

local kitty_socket = string.format("unix:@kitty-%s", vim.fn.getenv("KITTY_PID"))
local last_color = nil

local function set_tab_color(color)
	if color == last_color then
		return
	end
	last_color = color

	vim.loop.spawn("kitty", {
		args = { "@", "--to", kitty_socket, "set-colors", "active_tab_background=" .. color },
		detached = true,
	}, function() end)
end

-- local timer = vim.loop.new_timer()
local timer = assert(vim.loop.new_timer(), "Failed to create timer")

--
vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		local ft = vim.bo.filetype
		if ft == "snacks_picker_input" or ft == "snacks_input" then
			return
		end

		local mode = vim.fn.mode()
		local color
		if mode == "i" then
			color = "#a6e3a1"
		elseif mode == "v" or mode == "V" or mode == "\22" then
			color = "#cba6f7"
		else
			color = "#89b4fa"
		end
		timer:stop()
		timer:start(
			20,
			0,
			vim.schedule_wrap(function()
				set_tab_color(color)
			end)
		)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "tr", "en" }
	end,
})

vim.api.nvim_set_hl(0, "BlinkCmpLabelMatchCustom", {
	fg = "#f38ba8", -- mauve
	bold = true,
	underline = true,
})

