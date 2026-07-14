-- ============================
-- Keybindings (Mac layout priority)
-- ============================
local map = vim.keymap.set

map("n", "<D-s>", ":w<CR>", { desc = "Save" })
map("n", "<D-q>", ":q<CR>", { desc = "Quit" })
map("n", "<D-a>", "ggVG", { desc = "Select all" })
map("n", "<D-c>", '"+y', { desc = "Copy to system clipboard" })
map("v", "<D-c>", '"+y', { desc = "Copy to system clipboard" })
map("n", "<D-v>", '"+p', { desc = "Paste from system clipboard" })
map("i", "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- ============================
-- Leader Mappings
-- (NERDTree -> neo-tree, fzf.vim -> Telescope, vim-airline -> lualine,
--  which-key config lives in lua/plugins/whichkey.lua)
-- ============================
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>g", ":Telescope live_grep<CR>", { desc = "Grep search" })
map("n", "<leader>b", ":Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Search lines in buffer" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>?", function()
  require("config.cheatsheet").open()
end, { desc = "Open cheatsheet" })
