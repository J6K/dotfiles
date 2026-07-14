-- Telescope replaces fzf + fzf.vim. It's the standard modern fuzzy-finder,
-- integrates with LSP/git/treesitter out of the box, and is pure Lua so
-- there's no external binary to install (beyond ripgrep for live_grep).
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Grep search" },
    { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search lines in buffer" },
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
    pcall(telescope.load_extension, "fzf")
  end,
}
