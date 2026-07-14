-- gitsigns.nvim replaces vim-gitgutter: same sign-column diff markers,
-- but faster (Lua, async) and adds hunk stage/preview/blame.
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {}, -- defaults are sensible; run :Gitsigns to explore hunk actions
}
