local colors_file = vim.fn.expand(
  "~/.local/state/quickshell/user/generated/material_colors.scss"
)

local function load_colors()
  local colors = {}

  local file = io.open(colors_file, "r")
  if not file then
    vim.notify(
      "Could not open end-4 material colors: " .. colors_file,
      vim.log.levels.WARN
    )
    return colors
  end

  for line in file:lines() do
    local name, value = line:match("^%$([%w_]+):%s*(#[%da-fA-F]+);")

    if name and value then
      colors[name] = value
    end
  end

  file:close()

  return colors
end

local c = load_colors()

-- Core editor
vim.api.nvim_set_hl(0, "Normal", {
  fg = c.onBackground,
  bg = c.background,
})

vim.api.nvim_set_hl(0, "NormalFloat", {
  fg = c.onSurface,
  bg = c.surfaceContainer,
})

vim.api.nvim_set_hl(0, "FloatBorder", {
  fg = c.outline,
  bg = c.surfaceContainer,
})

vim.api.nvim_set_hl(0, "CursorLine", {
  bg = c.surfaceContainerLow,
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = c.primary,
  bold = true,
})

vim.api.nvim_set_hl(0, "LineNr", {
  fg = c.outline,
})

vim.api.nvim_set_hl(0, "Visual", {
  bg = c.primaryContainer,
  fg = c.onPrimaryContainer,
})

vim.api.nvim_set_hl(0, "Search", {
  bg = c.primaryContainer,
  fg = c.onPrimaryContainer,
})

vim.api.nvim_set_hl(0, "IncSearch", {
  bg = c.primary,
  fg = c.onPrimary,
})

vim.api.nvim_set_hl(0, "MatchParen", {
  fg = c.primary,
  bold = true,
  underline = true,
})

-- Syntax
vim.api.nvim_set_hl(0, "Comment", {
  fg = c.onSurfaceVariant,
  italic = true,
})

vim.api.nvim_set_hl(0, "String", {
  fg = c.secondary,
})

vim.api.nvim_set_hl(0, "Character", {
  fg = c.secondary,
})

vim.api.nvim_set_hl(0, "Number", {
  fg = c.tertiary,
})

vim.api.nvim_set_hl(0, "Boolean", {
  fg = c.tertiary,
})

vim.api.nvim_set_hl(0, "Constant", {
  fg = c.tertiary,
})

vim.api.nvim_set_hl(0, "Identifier", {
  fg = c.onBackground,
})

vim.api.nvim_set_hl(0, "Function", {
  fg = c.primary,
})

vim.api.nvim_set_hl(0, "Statement", {
  fg = c.primary,
})

vim.api.nvim_set_hl(0, "Keyword", {
  fg = c.primary,
})

vim.api.nvim_set_hl(0, "Type", {
  fg = c.secondary,
})

vim.api.nvim_set_hl(0, "Operator", {
  fg = c.onSurfaceVariant,
})

vim.api.nvim_set_hl(0, "PreProc", {
  fg = c.tertiary,
})

vim.api.nvim_set_hl(0, "Special", {
  fg = c.tertiary,
})

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", {
  fg = c.error,
})

vim.api.nvim_set_hl(0, "DiagnosticWarn", {
  fg = c.tertiary,
})

vim.api.nvim_set_hl(0, "DiagnosticInfo", {
  fg = c.primary,
})

vim.api.nvim_set_hl(0, "DiagnosticHint", {
  fg = c.success,
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  sp = c.error,
  undercurl = true,
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  sp = c.tertiary,
  undercurl = true,
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
  sp = c.primary,
  undercurl = true,
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  sp = c.success,
  undercurl = true,
})

-- Git
vim.api.nvim_set_hl(0, "DiffAdd", {
  fg = c.success,
  bg = c.successContainer,
})

vim.api.nvim_set_hl(0, "DiffDelete", {
  fg = c.error,
  bg = c.errorContainer,
})

vim.api.nvim_set_hl(0, "DiffChange", {
  fg = c.primary,
  bg = c.primaryContainer,
})

-- Popup/menu
vim.api.nvim_set_hl(0, "Pmenu", {
  fg = c.onSurface,
  bg = c.surfaceContainer,
})

vim.api.nvim_set_hl(0, "PmenuSel", {
  fg = c.onPrimaryContainer,
  bg = c.primaryContainer,
})

vim.api.nvim_set_hl(0, "PmenuBorder", {
  fg = c.outline,
  bg = c.surfaceContainer,
})

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", {
  fg = c.onSurface,
  bg = c.surfaceContainer,
})

vim.api.nvim_set_hl(0, "TelescopeBorder", {
  fg = c.outline,
  bg = c.surfaceContainer,
})

vim.api.nvim_set_hl(0, "TelescopeSelection", {
  fg = c.onPrimaryContainer,
  bg = c.primaryContainer,
})

vim.api.nvim_set_hl(0, "TelescopeMatching", {
  fg = c.primary,
  bold = true,
})
