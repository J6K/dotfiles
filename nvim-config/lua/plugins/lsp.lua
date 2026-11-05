-- ============================
-- Language servers (replaces coc.nvim)
--   mason.nvim       installs language servers
--   mason-lspconfig  installs the servers below and enables them
--   nvim-lspconfig   ships the default config for each server
-- Uses Neovim's built-in LSP client (vim.lsp.config / vim.lsp.enable).
-- ============================

-- Edit this list to match the languages you use. Browse options with :Mason.
local SERVERS = { "lua_ls", "pyright", "ts_ls", "bashls" }

--- Buffer-local keymaps, set whenever a server attaches to a buffer.
local function set_lsp_keymaps(bufnr)
  local function map(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("gd", vim.lsp.buf.definition, "Go to definition")
  map("gr", vim.lsp.buf.references, "Go to references")
  map("K", vim.lsp.buf.hover, "Hover docs")
  map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
  map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
end

local function setup_lsp()
  -- settings shared by every server: advertise nvim-cmp completion support
  vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(args)
      set_lsp_keymaps(args.buf)
    end,
  })
end

return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    lazy = true, -- loaded as a dependency of mason-lspconfig below
    config = setup_lsp,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = SERVERS,
      automatic_enable = true, -- calls vim.lsp.enable() for installed servers
    },
  },
}
