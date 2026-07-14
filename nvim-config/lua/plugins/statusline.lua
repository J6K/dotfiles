-- lualine.nvim replaces vim-airline: the current standard statusline plugin,
-- configured entirely in Lua and noticeably faster to render.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
    },
  },
}
