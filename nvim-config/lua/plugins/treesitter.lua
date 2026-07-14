-- Treesitter: the old `syntax on` regex-based highlighting is replaced with
-- real parsing. Better highlighting, indenting, and text objects.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline",
        "json", "yaml", "python", "javascript", "typescript", "html", "css",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
