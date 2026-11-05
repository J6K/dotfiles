-- ============================
-- lualine: statusline (replaces vim-airline).
-- Theme lives in lua/lualine/themes/indigo_clear.lua.
-- ============================
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "indigo_clear",
      globalstatus = true,
    },
  },
}
