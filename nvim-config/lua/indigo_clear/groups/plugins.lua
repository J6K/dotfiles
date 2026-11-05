-- Plugin-specific groups. Most plugins already link to the core groups;
-- only overrides that improve the look are listed.
---@param c table palette
return function(c)
  return {
    -- gitsigns
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.blue },
    GitSignsDelete = { fg = c.red },

    -- telescope
    TelescopeNormal = { link = "NormalFloat" },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopeTitle = { link = "FloatTitle" },
    TelescopeSelection = { bg = c.bg_visual },
    TelescopeMatching = { fg = c.yellow, bold = true },
    TelescopePromptPrefix = { fg = c.purple },

    -- neo-tree
    NeoTreeNormal = { fg = c.fg, bg = c.bg_dark },
    NeoTreeNormalNC = { link = "NeoTreeNormal" },
    NeoTreeWinSeparator = { fg = c.bg_dark, bg = c.bg_dark },
    NeoTreeDirectoryIcon = { fg = c.blue },
    NeoTreeDirectoryName = { fg = c.blue },
    NeoTreeRootName = { fg = c.purple, bold = true },
    NeoTreeGitAdded = { fg = c.green },
    NeoTreeGitModified = { fg = c.yellow },
    NeoTreeGitUntracked = { fg = c.cyan },

    -- nvim-cmp completion menu
    CmpItemAbbrMatch = { fg = c.yellow, bold = true },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpItemKind = { fg = c.cyan },
    CmpItemMenu = { fg = c.comment },

    -- which-key
    WhichKey = { fg = c.purple },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.fg },
  }
end
