-- ============================
-- Entry point
-- ============================
-- Leader must be set before lazy.nvim loads any plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.lazy")      -- bootstraps lazy.nvim and loads lua/plugins/*.lua
require("config.keymaps")
require("config.autocmds")
