-- ============================
-- gitsigns: diff markers in the sign column (replaces vim-gitgutter).
-- Run :Gitsigns to explore hunk stage / preview / blame.
-- ============================
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
