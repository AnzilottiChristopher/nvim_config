vim.cmd("highlight clear")
vim.cmd("set termguicolors")
vim.g.colors_name = "material_ocean2"

local c = {
  bg      = "#07080d",
  bg_alt = "#1a1c25",
  fg      = "#e5ebff",
  gray    = "#545c7e",

  blue    = "#82aaff",
  cyan    = "#89ddff",
  teal    = "#4fd6be",
  green   = "#c3e88d",
  yellow  = "#ffcb6b",
  orange  = "#f78c6c",
  red     = "#ff5370",
  purple  = "#c792ea",
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

hi("Visual",        { bg = "#283457" })
hi("Search",        { fg = c.bg, bg = c.yellow })
hi("IncSearch",     { fg = c.bg, bg = c.orange })

hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.bg, bg = c.blue })

-- =====================
-- Base Syntax
-- =====================
hi("Comment",       { fg = c.gray, italic = true })
hi("Keyword",       { fg = c.purple })
hi("Function",      { fg = c.blue })
hi("Identifier",    { fg = c.cyan })
hi("Type",          { fg = c.teal })
hi("String",        { fg = c.green })
hi("Number",        { fg = c.orange })
hi("Boolean",       { fg = c.orange })
hi("Constant",      { fg = c.cyan })
hi("Operator",      { fg = c.purple })
hi("Special",       { fg = c.cyan })
hi("PreProc",       { fg = c.purple })
hi("Structure",     { fg = c.purple })
hi("StorageClass",  { fg = c.purple })
hi("Delimiter",     { fg = c.cyan })

-- =====================
-- Diagnostics
-- =====================
hi("DiagnosticError", { fg = c.red })
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
hi("@keyword",        { fg = c.purple })
hi("@keyword.return", { fg = c.purple })
hi("@function",       { fg = c.blue })
hi("@method",         { fg = c.blue })
hi("@type",           { fg = c.teal })
hi("@type.builtin",   { fg = c.teal, italic = true })
hi("@variable",       { fg = c.cyan })
hi("@string",         { fg = c.green })
hi("@number",         { fg = c.orange })
hi("@boolean",        { fg = c.orange })
hi("@constant",       { fg = c.cyan })
hi("@operator",       { fg = c.purple })
hi("@parameter",      { fg = c.orange })
hi("@property",       { fg = c.cyan })
hi("@field",          { fg = c.cyan })
hi("@punctuation.delimiter", { fg = c.cyan })
hi("@punctuation.bracket",   { fg = c.cyan })
hi("@tag",            { fg = c.red })
hi("@tag.attribute",  { fg = c.yellow })
hi("@namespace",      { fg = c.teal })

-- =====================
-- Rust-specific
-- =====================
hi("@type.builtin.rust",      { fg = c.teal, bold = true })
hi("@function.macro.rust",    { fg = c.orange })
hi("@keyword.rust",           { fg = c.purple })
hi("@constant.builtin.rust",  { fg = c.cyan })
hi("@punctuation.bracket.rust",{ fg = c.cyan })
