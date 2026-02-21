vim.cmd("highlight clear")
vim.cmd("set termguicolors")
vim.g.colors_name = "deep-ocean-high-contrast"

-- High Contrast Deep Ocean Color Palette
local c = {
  bg      = "#000B1E",  -- Much darker background (almost black)
  bg_alt  = "#0F1419",  -- Darker sidebars
  fg      = "#E5E9F0",  -- Brighter foreground for contrast
  fg_bright = "#FFFFFF", -- Pure white for maximum contrast
  gray    = "#607080",  -- Brighter comments
  
  -- High contrast accent colors
  blue    = "#8AAAFF",  -- Brighter blue
  cyan    = "#89DDFF",  -- Bright cyan
  teal    = "#5FFFD7",  -- Vivid teal
  green   = "#C3E88D",  -- Lime green
  yellow  = "#FFD700",  -- Gold yellow (higher contrast)
  orange  = "#FF9E64",  -- Bright orange
  red     = "#FF6B6B",  -- Vivid red
  purple  = "#D4BFFF",  -- Brighter purple
  pink    = "#FF5370",  
  
  -- UI specific
  selection = "#264F78",  -- Higher contrast selection
  line_highlight = "#0A1628",
  cursor = "#FFCC00",
  border = "#1E3A5F",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- =====================
-- UI
-- =====================
hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_alt })
hi("CursorLine",    { bg = c.line_highlight })
hi("CursorColumn",  { bg = c.line_highlight })
hi("LineNr",        { fg = c.gray })
hi("CursorLineNr",  { fg = c.yellow, bold = true })

hi("StatusLine",    { fg = c.fg_bright, bg = c.bg_alt, bold = true })
hi("StatusLineNC",  { fg = c.gray, bg = c.bg_alt })
hi("VertSplit",     { fg = c.border })
hi("WinSeparator",  { fg = c.border })

hi("Visual",        { bg = c.selection })
hi("Search",        { fg = c.bg, bg = c.yellow, bold = true })
hi("IncSearch",     { fg = c.bg, bg = c.orange, bold = true })

hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.bg, bg = c.blue, bold = true })
hi("PmenuSbar",     { bg = c.bg_alt })
hi("PmenuThumb",    { bg = c.blue })

-- Tab line
hi("TabLine",       { fg = c.gray, bg = c.bg_alt })
hi("TabLineSel",    { fg = c.fg_bright, bg = c.bg, bold = true })
hi("TabLineFill",   { bg = c.bg_alt })

-- =====================
-- Base Syntax
-- =====================
hi("Comment",       { fg = c.gray, italic = true })
hi("Keyword",       { fg = c.purple, bold = true })
hi("Function",      { fg = c.blue, bold = true })
hi("Identifier",    { fg = c.cyan })
hi("Type",          { fg = c.yellow, bold = true })
hi("String",        { fg = c.green })
hi("Number",        { fg = c.orange })
hi("Boolean",       { fg = c.orange, bold = true })
hi("Constant",      { fg = c.orange })
hi("Operator",      { fg = c.cyan })
hi("Special",       { fg = c.teal })
hi("PreProc",       { fg = c.purple })
hi("Structure",     { fg = c.purple, bold = true })
hi("StorageClass",  { fg = c.purple, bold = true })
hi("Delimiter",     { fg = c.cyan })

-- =====================
-- Diagnostics (High Contrast)
-- =====================
hi("DiagnosticError", { fg = c.red, bold = true })
hi("DiagnosticWarn",  { fg = c.yellow, bold = true })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.teal })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.teal })

-- =====================
-- Git
-- =====================
hi("DiffAdd",       { fg = c.green, bold = true })
hi("DiffDelete",    { fg = c.red, bold = true })
hi("DiffChange",    { fg = c.blue, bold = true })
hi("DiffText",      { fg = c.yellow, bold = true })

-- =====================
-- Treesitter (High Contrast)
-- =====================
hi("@comment",        { fg = c.gray, italic = true })
hi("@keyword",        { fg = c.purple, bold = true })
hi("@keyword.return", { fg = c.purple, bold = true })
hi("@keyword.function", { fg = c.purple, bold = true })
hi("@keyword.import", { fg = c.purple, bold = true })
hi("@function",       { fg = c.blue, bold = true })
hi("@method",         { fg = c.blue, bold = true })
hi("@type",           { fg = c.yellow, bold = true })
hi("@type.builtin",   { fg = c.yellow, bold = true, italic = true })
hi("@variable",       { fg = c.cyan })
hi("@variable.builtin", { fg = c.red, bold = true })
hi("@string",         { fg = c.green })
hi("@number",         { fg = c.orange })
hi("@boolean",        { fg = c.orange, bold = true })
hi("@constant",       { fg = c.orange })
hi("@constant.builtin", { fg = c.orange, bold = true })
hi("@operator",       { fg = c.cyan, bold = true })
hi("@parameter",      { fg = c.orange })
hi("@property",       { fg = c.cyan })
hi("@field",          { fg = c.cyan })
hi("@punctuation.delimiter", { fg = c.fg })
hi("@punctuation.bracket",   { fg = c.fg })
hi("@tag",            { fg = c.red, bold = true })
hi("@tag.attribute",  { fg = c.yellow })
hi("@namespace",      { fg = c.teal, bold = true })
hi("@constructor",    { fg = c.blue, bold = true })

-- =====================
-- Language Specific
-- =====================
-- Python
hi("@keyword.conditional.python", { fg = c.purple, bold = true })
hi("@keyword.repeat.python", { fg = c.purple, bold = true })

-- JavaScript/TypeScript
hi("@keyword.conditional.javascript", { fg = c.purple, bold = true })
hi("@keyword.conditional.typescript", { fg = c.purple, bold = true })

-- Rust
hi("@type.builtin.rust",      { fg = c.yellow, bold = true })
hi("@function.macro.rust",    { fg = c.orange, bold = true })
hi("@keyword.rust",           { fg = c.purple, bold = true })
hi("@constant.builtin.rust",  { fg = c.orange, bold = true })
hi("@punctuation.bracket.rust",{ fg = c.fg })
