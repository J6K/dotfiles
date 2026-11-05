local M = {}

local function to_rgb(hex)
  return tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16)
end

--- Mix `top` over `bottom`. alpha = 1 gives top, alpha = 0 gives bottom.
---@param top string "#RRGGBB"
---@param bottom string "#RRGGBB"
---@param alpha number 0..1
function M.blend(top, bottom, alpha)
  local tr, tg, tb = to_rgb(top)
  local br, bg, bb = to_rgb(bottom)
  local function mix(a, b)
    return math.floor(a * alpha + b * (1 - alpha) + 0.5)
  end
  return ("#%02X%02X%02X"):format(mix(tr, br), mix(tg, bg), mix(tb, bb))
end

return M
