-- ============================
-- Autocommands
-- ============================
local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

-- Strip trailing whitespace on save, without moving the cursor or
-- polluting search history
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})
