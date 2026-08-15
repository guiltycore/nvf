vim.keymap.set("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>fT", function()
  Snacks.picker.files({
    layout = { preset = "vscode" },

    actions = {
      smart_jump = function(picker, item)
        picker:close()

        if not item or not item.file then
          return
        end

        local target_file = vim.fn.fnamemodify(item.file, ":p")
        local found_tab = nil
        local found_win = nil

        for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_name = vim.api.nvim_buf_get_name(buf)

            if buf_name ~= ""
                and vim.fn.fnamemodify(buf_name, ":p") == target_file then
              found_tab = tabpage
              found_win = win
              break
            end
          end

          if found_tab then
            break
          end
        end

        if found_tab and found_win then
          vim.api.nvim_set_current_tabpage(found_tab)
          vim.api.nvim_set_current_win(found_win)
        else
          vim.cmd("edit " .. vim.fn.fnameescape(item.file))
        end
      end,
    },

    win = {
      input = {
        keys = {
          ["<CR>"] = { "smart_jump", mode = { "i", "n" } },
        },
      },
      list = {
        keys = {
          ["<CR>"] = { "smart_jump", mode = { "i", "n" } },
        },
      },
    },
  })
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fc", function()
  Snacks.picker.files({
    cwd = vim.fn.stdpath("config"),
  })
end, { desc = "Find Config File" })

vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.files({
    cwd = "~/.config",
  })
end, { desc = "Find ~/.config Files" })

vim.keymap.set("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>fr", function()
  Snacks.picker.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>fi", function()
  Snacks.picker.icons()
end, { desc = "Icons" })

vim.keymap.set("n", "<leader>ft", function()
  Snacks.picker.todo_comments({
    layout = { preset = "vertical" },
  })
end, { desc = "Todo Comments" })

vim.keymap.set("n", "<leader>fl", function()
  Snacks.picker.lines()
end, { desc = "Buffer Lines" })

vim.keymap.set("n", "<leader>fk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Help Pages" })

vim.keymap.set("n", "<leader>fm", function()
  Snacks.picker.man()
end, { desc = "Man Pages" })

vim.keymap.set("n", "<leader>fu", function()
  Snacks.picker.undo()
end, { desc = "Undo History" })

vim.keymap.set("n", "<leader>f:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>nu", function()
  Snacks.picker.notifications()
end, { desc = "Notifications History" })

vim.keymap.set({ "n", "x" }, "<leader>fw", function()
  Snacks.picker.grep_word()
end, { desc = "Grep Word" })

vim.keymap.set("n", "<leader>fs", function()
  Snacks.picker.grep({
    layout = { preset = "ivy" },
  })
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>ss", function()
  Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })

vim.keymap.set("n", "<leader>foi", function()
  Snacks.picker.lsp_incoming_calls()
end, { desc = "LSP Incoming Calls" })

vim.keymap.set("n", "<leader>foo", function()
  Snacks.picker.lsp_outgoing_calls()
end, { desc = "LSP Outgoing Calls" })

vim.keymap.set("n", "<leader>xx", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>xX", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics Buffer" })


-- Explorer

vim.keymap.set("n", "<M-1>", function()
  Snacks.explorer()
end, { desc = "Toggle File Explorer" })


-- Git

vim.keymap.set("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

vim.keymap.set("n", "<leader>ga", function()
  Snacks.git.blame_line()
end, { desc = "Git Blame Line" })

vim.keymap.set("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })

vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })

vim.keymap.set("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, { desc = "Git Stash" })

vim.keymap.set("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })

vim.keymap.set("n", "<leader>gi", function()
  Snacks.picker.gh_issue()
end, { desc = "GitHub Issues" })

vim.keymap.set("n", "<leader>gI", function()
  Snacks.picker.gh_issue({
    state = "all",
  })
end, { desc = "GitHub Issues (All)" })

vim.keymap.set("n", "<leader>gp", function()
  Snacks.picker.gh_pr()
end, { desc = "GitHub Pull Requests" })

vim.keymap.set("n", "<leader>gP", function()
  Snacks.picker.gh_pr({
    state = "all",
  })
end, { desc = "GitHub Pull Requests (All)" })


-- Lazygit

vim.keymap.set("n", "<leader>lg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

vim.keymap.set("n", "<leader>ll", function()
  Snacks.lazygit.log()
end, { desc = "Lazygit Log" })

vim.keymap.set("n", "<leader>lf", function()
  Snacks.lazygit.log_file()
end, { desc = "Lazygit Log File" })


-- Bufdelete

vim.keymap.set("n", "<leader>bda", function()
  Snacks.bufdelete.all()
end, { desc = "Delete All Buffers" })

vim.keymap.set("n", "<leader>bdf", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })


-- Snacks Dim

vim.keymap.set("n", "<leader>di", function()
  if vim.g.snacks_dim then
    Snacks.dim.disable()
    vim.g.snacks_dim = false
    Snacks.notify("Dim disabled", {
      level = vim.log.levels.INFO,
    })
  else
    Snacks.dim.enable()
    vim.g.snacks_dim = true
    Snacks.notify("Dim enabled", {
      level = vim.log.levels.INFO,
    })
  end
end, { desc = "Toggle Snacks Dim" })


-- Neovim News

vim.keymap.set("n", "<leader>N", function()
  local file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1]

  if not file then
    vim.notify("news.txt not found", vim.log.levels.ERROR)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_call(buf, function()
    vim.cmd("silent read " .. file)
  end)

  Snacks.win({
    buf = buf,
    width = 0.46,
    height = 0.7,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  })
end, { desc = "Neovim News" })
