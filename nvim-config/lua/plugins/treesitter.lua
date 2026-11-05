-- ============================
-- Treesitter: real parsing instead of regex syntax highlighting, plus
-- better indentation. Uses the nvim-treesitter `main` branch (required on
-- Neovim 0.12+).
--
-- Compiling parsers needs the `tree-sitter` CLI and a C compiler (see the
-- README). Without them, the parsers Neovim bundles (lua, vim, vimdoc,
-- markdown, ...) still work and everything else falls back to regex syntax.
-- ============================
local platform = require("config.platform")

local PARSERS = {
  "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline",
  "json", "yaml", "python", "javascript", "typescript", "html", "css",
}

--- Turn on treesitter highlighting and indent for a buffer, if a parser exists.
local function attach(bufnr)
  if pcall(vim.treesitter.start, bufnr) then
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local function setup()
  local treesitter = require("nvim-treesitter")
  treesitter.setup()

  if platform.has("tree-sitter") then
    treesitter.install(PARSERS) -- no-op for parsers already installed
  end

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
    callback = function(args)
      attach(args.buf)
    end,
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- the main branch does not support lazy-loading
  build = ":TSUpdate",
  config = setup,
}
