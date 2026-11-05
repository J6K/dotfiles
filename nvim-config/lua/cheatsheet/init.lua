-- ============================
-- Cheatsheet: <leader>? opens a read-only markdown split.
-- Content lives in cheatsheet/sections.lua.
-- ============================
local M = {}

local BUF_NAME = "__NvimCheatsheet__"
local KEY_COLUMN_WIDTH = 17

--- Turn the section table into aligned markdown lines.
local function render(sections)
  local lines = { "# NVIM CHEATSHEET" }
  for _, section in ipairs(sections) do
    local title, rows = section[1], section[2]
    table.insert(lines, "")
    table.insert(lines, "## " .. title)
    for _, row in ipairs(rows) do
      local keys, desc = row[1], row[2]
      table.insert(lines, ("  %-" .. KEY_COLUMN_WIDTH .. "s%s"):format(keys, desc))
    end
  end
  return lines
end

--- Return the window already showing the cheatsheet, if any.
local function find_open_window()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if name:match(BUF_NAME .. "$") then
      return win
    end
  end
end

--- Create a throwaway, read-only buffer filled with the cheatsheet.
local function create_buffer()
  local buf = vim.api.nvim_create_buf(false, true) -- unlisted scratch buffer
  vim.api.nvim_buf_set_name(buf, BUF_NAME)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, render(require("cheatsheet.sections")))
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].modifiable = false
  return buf
end

function M.open()
  local existing = find_open_window()
  if existing then
    vim.api.nvim_set_current_win(existing)
    return
  end

  vim.cmd("vsplit")
  vim.api.nvim_win_set_buf(0, create_buffer())
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

return M
