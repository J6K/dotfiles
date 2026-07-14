-- ============================
-- Plugin Manager (lazy.nvim)
-- Replaces vim-plug. Auto-installs itself on first launch, same as the
-- old vim-plug bootstrap block used to.
-- ============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = { colorscheme = { "solarized" } },
  checker = { enabled = true, notify = false }, -- auto-check for plugin updates
  change_detection = { notify = false },
})
