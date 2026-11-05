-- lualine looks up themes at lualine/themes/<name>, so statusline.lua can
-- just say `theme = "indigo_clear"`.
local c = require("indigo_clear.palette")

local function mode(accent)
  return {
    a = { fg = c.bg, bg = accent, gui = "bold" },
    b = { fg = c.fg, bg = c.border },
    c = { fg = c.fg_dim, bg = c.bg_dark },
  }
end

return {
  normal = mode(c.blue),
  insert = mode(c.green),
  visual = mode(c.purple),
  replace = mode(c.red),
  command = mode(c.yellow),
  terminal = mode(c.cyan),
  inactive = {
    a = { fg = c.comment, bg = c.bg_dark },
    b = { fg = c.comment, bg = c.bg_dark },
    c = { fg = c.comment, bg = c.bg_dark },
  },
}
