-- ============================
-- Indigo Clear colorscheme
-- Matches the Windows Terminal "Indigo Clear" scheme used by PowerShell.
--   palette.lua         colors (edit here)
--   groups/editor.lua   UI highlight groups
--   groups/syntax.lua   code highlight groups
--   groups/plugins.lua  plugin highlight groups
-- ============================
local M = {}

local GROUP_MODULES = { "editor", "syntax", "plugins" }

--- Give :terminal buffers the same 16 ANSI colors as the real terminal.
local function set_terminal_colors(t)
  local ansi = {
    t.black, t.red, t.green, t.yellow, t.blue, t.purple, t.cyan, t.white,
    t.bright_black, t.bright_red, t.bright_green, t.bright_yellow,
    t.bright_blue, t.bright_purple, t.bright_cyan, t.bright_white,
  }
  for i, color in ipairs(ansi) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

function M.load()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.g.colors_name = "indigo_clear"

  local palette = require("indigo_clear.palette")
  for _, name in ipairs(GROUP_MODULES) do
    local groups = require("indigo_clear.groups." .. name)(palette)
    for group, spec in pairs(groups) do
      vim.api.nvim_set_hl(0, group, spec)
    end
  end

  set_terminal_colors(palette.terminal)
end

return M
