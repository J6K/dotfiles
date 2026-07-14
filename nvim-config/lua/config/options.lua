-- ============================
-- Basic Settings
-- (ported 1:1 from the old vimrc `set` block; Neovim defaults already cover
--  a lot of what vim-sensible used to add, so that plugin is gone too)
-- ============================
local opt = vim.opt

opt.number = true              -- Show line numbers
opt.relativenumber = true      -- Relative numbers (great for motions: 5j, 3k)
opt.cursorline = true          -- Highlight current line
opt.mouse = "a"                -- Enable mouse support
opt.clipboard = "unnamedplus"  -- Use system clipboard everywhere
opt.hidden = true               -- Allow background buffers (default true in nvim, kept explicit)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.scrolloff = 8              -- Keep 8 lines above/below cursor
opt.signcolumn = "yes"         -- Always show sign column (prevents layout jump)
opt.updatetime = 300           -- Faster CursorHold (helps gitsigns, LSP)
opt.encoding = "utf-8"
opt.swapfile = false           -- Avoid swap file annoyances
opt.undofile = true            -- Persistent undo across sessions
opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")

opt.splitbelow = true          -- Open splits more naturally
opt.splitright = true
opt.ignorecase = true          -- Case-insensitive search unless caps
opt.smartcase = true
opt.incsearch = true           -- Incremental search
opt.hlsearch = true            -- Highlight search matches

opt.termguicolors = true       -- True color support (needed by most modern themes)
opt.background = "dark"

-- make sure the undo dir actually exists
vim.fn.mkdir(vim.fn.expand("~/.local/state/nvim/undo"), "p")
