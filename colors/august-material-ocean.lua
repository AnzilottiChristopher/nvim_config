vim.cmd("highlight clear")
vim.cmd("set termguicolors")
vim.g.colors_name = "material-ocean"

local c = {
  bg      = "#090b10",
  bg_alt = "#14161d",
  fg      = "#dbe2ff",
  gray    = "#5f6a95",

  blue    = "#8aadff",
  cyan    = "#9fdcff",
  teal    = "#5de4c7",
  green   = "#c6f68d",
  yellow  = "#ffd580",
  orange  = "#ff9e64",
  red     = "#ff5c8a",
  purple  = "#d2a6ff",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- =====================
-- UI
-- =====================
hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_alt })
hi("CursorLine",    { bg = c.bg_alt })
hi("CursorColumn",  { bg = c.bg_alt })

hi("LineNr",        { fg = c.gray })
hi("CursorLineNr",  { fg = c.yellow, bold = true })

hi("StatusLine",    { fg = c.fg, bg = c.bg_alt })
hi("StatusLineNC",  { fg = c.gray, bg = c.bg_alt })
hi("VertSplit",     { fg = c.bg_alt })

hi("Visual",        { bg = "#25305a" })
hi("Search",        { fg = c.bg, bg = c.yellow })
hi("IncSearch",     { fg = c.bg, bg = c.orange })

hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.bg, bg = c.blue })

-- =====================
-- Base Syntax
-- =====================
hi("Comment",       { fg = c.gray, italic = true })
hi("Keyword",       { fg = c.purple, bold = true })
hi("Function",      { fg = c.blue })
hi("Identifier",    { fg = c.fg })
hi("Type",          { fg = c.teal, bold = true })
hi("String",        { fg = c.green })
hi("Number",        { fg = c.orange })
hi("Boolean",       { fg = c.orange })
hi("Constant",      { fg = c.cyan })
hi("Operator",      { fg = c.purple })

-- =====================
-- Diagnostics
-- =====================
hi("DiagnosticError", { fg = c.red, bold = true })
hi("DiagnosticWarn",  { fg = c.yellow })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.teal })

-- =====================
-- Git
-- =====================
hi("DiffAdd",       { fg = c.green })
hi("DiffDelete",    { fg = c.red })
hi("DiffChange",    { fg = c.blue })

-- =====================
-- Treesitter
-- =====================
hi("@comment",        { fg = c.gray, italic = true })
hi("@keyword",        { fg = c.purple, bold = true })
hi("@keyword.return", { fg = c.purple })
hi("@function",       { fg = c.blue })
hi("@method",         { fg = c.blue })
hi("@type",           { fg = c.teal, bold = true })
hi("@type.builtin",   { fg = c.teal, italic = true })
hi("@variable",       { fg = c.fg })
hi("@string",         { fg = c.green })
hi("@number",         { fg = c.orange })
hi("@boolean",        { fg = c.orange })
hi("@constant",       { fg = c.cyan })
hi("@operator",       { fg = c.purple })

-- =====================
-- Rust-specific
-- =====================
hi("@type.builtin.rust",        { fg = c.teal, bold = true })
hi("@function.macro.rust",      { fg = c.orange, bold = true })
hi("@keyword.rust",             { fg = c.purple })
hi("@constant.builtin.rust",    { fg = c.cyan })
hi("@lifetime.rust",            { fg = c.yellow, italic = true })
hi("@punctuation.bracket.rust", { fg = c.fg })
