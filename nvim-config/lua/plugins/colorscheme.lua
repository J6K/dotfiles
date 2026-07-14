-- Modern, actively-maintained Solarized port (the old altercation/vim-colors-solarized
-- is unmaintained and looks rough with true colors). Swap the `name` line below for
-- any other theme if you'd rather move on from Solarized entirely.
return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000, -- load before other plugins
  config = function()
    require("solarized").setup({
      variant = "winter", -- winter = dark and cool, closest to the classic look
    })
    vim.cmd.colorscheme("solarized")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- transparent background, like the old `highlight Normal ctermbg=NONE`
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
