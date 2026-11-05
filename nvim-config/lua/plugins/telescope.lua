-- ============================
-- Telescope: fuzzy finder (replaces fzf + fzf.vim). Needs ripgrep for
-- live_grep.
-- ============================
local platform = require("config.platform")

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      -- Optional native sorter. Skipped when there's no C toolchain (e.g. stock
      -- Windows), in which case Telescope uses its built-in Lua sorter.
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = platform.can_build_c,
    },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>f", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>g", "<Cmd>Telescope live_grep<CR>", desc = "Grep search" },
    { "<leader>b", "<Cmd>Telescope buffers<CR>", desc = "List buffers" },
    { "<leader>/", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search lines in buffer" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
      },
    })
    pcall(telescope.load_extension, "fzf") -- fine if fzf-native was skipped
  end,
}
