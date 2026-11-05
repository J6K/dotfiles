-- ============================
-- Core keymaps
-- Plugin-specific maps live next to their plugin in lua/plugins/
-- (e.g. <leader>f in telescope.lua, <leader>e in neotree.lua) so each
-- file is self-contained. LSP maps are in lua/plugins/lsp.lua.
-- ============================
local platform = require("config.platform")
local map = vim.keymap.set

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Leader
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>?", function() require("cheatsheet").open() end, { desc = "Open cheatsheet" })

-- OS-specific shortcuts
if platform.is_mac then
  -- Cmd-key maps only reach nvim in GUIs (Neovide) or terminals that forward Cmd.
  map("n", "<D-s>", "<Cmd>w<CR>", { desc = "Save" })
  map("n", "<D-q>", "<Cmd>q<CR>", { desc = "Quit" })
  map("n", "<D-a>", "ggVG", { desc = "Select all" })
  map({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
  map("n", "<D-v>", '"+p', { desc = "Paste from system clipboard" })
  map("i", "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })
else
  -- Only Ctrl shortcuts that don't shadow core Vim keys: <C-a>, <C-c>, <C-v>
  -- stay as increment / interrupt / visual-block.
  map({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save" })
end
