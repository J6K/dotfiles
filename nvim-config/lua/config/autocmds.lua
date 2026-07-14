-- ============================
-- Autocommands
-- ============================
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Highlight yanked text briefly (nice modern touch, cheap to add)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
