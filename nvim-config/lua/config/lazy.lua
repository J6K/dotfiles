-- ============================
-- Plugin manager (lazy.nvim)
-- Clones itself on first launch, then loads every spec in lua/plugins/.
-- ============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = { colorscheme = { "indigo_clear" } },
  checker = { enabled = true, notify = false }, -- check for updates quietly
  change_detection = { notify = false },
})
