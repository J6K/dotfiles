-- ============================
-- Indigo Clear palette
-- `terminal` is copied verbatim from the Windows Terminal "Indigo Clear"
-- scheme (the PowerShell profile). Everything else is derived from it, so
-- changing a terminal color here updates the whole theme.
-- ============================
local blend = require("indigo_clear.util").blend

local terminal = {
  background = "#1E1B4B",
  foreground = "#F4F4FF",
  cursor = "#FFFFFF",
  selection = "#4338CA",

  black = "#2E2A6E",
  red = "#FF8A3D", -- orange-toned in this scheme
  green = "#4FE3C1",
  yellow = "#FFE27A",
  blue = "#A9B8FF",
  purple = "#FF9ED8",
  cyan = "#8FD8FF",
  white = "#DCDCF5",

  bright_black = "#8A88C6",
  bright_red = "#FFA866",
  bright_green = "#8AF0D8",
  bright_yellow = "#FFF0B0",
  bright_blue = "#CDD6FF",
  bright_purple = "#FFC4E8",
  bright_cyan = "#B8E8FF",
  bright_white = "#FFFFFF",
}

local bg = terminal.background

return {
  terminal = terminal,

  -- backgrounds, darkest to lightest
  bg_dark = blend("#000000", bg, 0.25), -- floats, sidebars, statusline
  bg = bg,
  bg_highlight = blend(terminal.black, bg, 0.6), -- cursor line
  bg_visual = terminal.selection,
  border = terminal.black,

  -- foregrounds
  fg = terminal.foreground,
  fg_dim = terminal.white,
  comment = terminal.bright_black,
  line_nr = blend(terminal.bright_black, bg, 0.6),

  -- accents
  red = terminal.red,
  green = terminal.green,
  yellow = terminal.yellow,
  blue = terminal.blue,
  purple = terminal.purple,
  cyan = terminal.cyan,

  -- tinted backgrounds for diffs
  diff_add = blend(terminal.green, bg, 0.18),
  diff_change = blend(terminal.blue, bg, 0.18),
  diff_delete = blend(terminal.red, bg, 0.18),
  diff_text = blend(terminal.blue, bg, 0.35),
}
