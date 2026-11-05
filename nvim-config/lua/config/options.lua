-- ============================
-- Editor options
-- Only non-defaults are listed; Neovim already enables hidden, incsearch,
-- hlsearch, utf-8, etc. (which is why vim-sensible is no longer needed).
-- ============================
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true -- great for motions: 5j, 3k
opt.cursorline = true
opt.signcolumn = "yes"    -- always shown, so diagnostics don't shift text

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Search
opt.ignorecase = true -- case-insensitive...
opt.smartcase = true  -- ...unless the pattern has capitals

-- Splits open below / to the right
opt.splitbelow = true
opt.splitright = true

-- Behaviour
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- y/p use the system clipboard
opt.scrolloff = 8
opt.updatetime = 300          -- faster CursorHold (gitsigns, LSP)
opt.swapfile = false
opt.undofile = true           -- persistent undo, stored in stdpath("state")/undo

-- Colors
opt.termguicolors = true
