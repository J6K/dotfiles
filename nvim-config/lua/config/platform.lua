-- ============================
-- Platform detection
-- One place for every OS check, so the rest of the config reads as
-- `if platform.is_mac then` instead of repeating vim.fn.has() calls.
-- ============================
local M = {}

M.is_mac = vim.fn.has("mac") == 1
M.is_windows = vim.fn.has("win32") == 1

--- True if every named program is on PATH.
---@param ... string
function M.has(...)
  for _, program in ipairs({ ... }) do
    if vim.fn.executable(program) ~= 1 then
      return false
    end
  end
  return true
end

--- True if `make` and the C compiler that Makefiles default to are available
--- (gcc on Windows, cc elsewhere).
function M.can_build_c()
  return M.has("make", M.is_windows and "gcc" or "cc")
end

return M
