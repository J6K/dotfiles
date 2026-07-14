-- coc.nvim used a separate Node-based language-server host. Neovim now has
-- a built-in LSP client, so this replaces coc with:
--   mason.nvim        -> installs language servers for you
--   mason-lspconfig   -> bridges mason <-> lspconfig
--   nvim-lspconfig    -> sane default configs per server
return {
  {
    "williamboman/mason.nvim",
    config = true, -- calls require("mason").setup()
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- adjust this list to the languages you actually use
      ensure_installed = { "lua_ls", "pyright", "tsserver", "bashls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      end

      for _, server in ipairs({ "lua_ls", "pyright", "tsserver", "bashls" }) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end,
  },
}
