-- Code highlighting: classic Vim syntax groups, plus the treesitter (@...)
-- groups that don't already fall back to them sensibly.
---@param c table palette
return function(c)
  return {
    Comment = { fg = c.comment, italic = true },
    Constant = { fg = c.red },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.red },
    Boolean = { fg = c.red },
    Float = { fg = c.red },

    Identifier = { fg = c.fg },
    Function = { fg = c.blue },

    Statement = { fg = c.purple },
    Keyword = { fg = c.purple },
    Conditional = { fg = c.purple },
    Repeat = { fg = c.purple },
    Exception = { fg = c.purple },
    Label = { fg = c.purple },
    Operator = { fg = c.cyan },

    PreProc = { fg = c.cyan },
    Include = { fg = c.purple },
    Type = { fg = c.yellow },
    StorageClass = { fg = c.purple },
    Structure = { fg = c.yellow },

    Special = { fg = c.cyan },
    Delimiter = { fg = c.fg_dim },
    Underlined = { underline = true },
    Error = { fg = c.red },
    Todo = { fg = c.bg, bg = c.yellow, bold = true },

    -- Treesitter
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.red, italic = true },
    ["@variable.parameter"] = { fg = c.fg_dim, italic = true },
    ["@variable.member"] = { fg = c.cyan },
    ["@property"] = { fg = c.cyan },
    ["@constant.builtin"] = { fg = c.red },
    ["@module"] = { fg = c.yellow },
    ["@function.builtin"] = { fg = c.blue, italic = true },
    ["@constructor"] = { fg = c.yellow },
    ["@string.escape"] = { fg = c.cyan },
    ["@string.special"] = { fg = c.cyan },
    ["@punctuation.bracket"] = { fg = c.fg_dim },
    ["@punctuation.delimiter"] = { fg = c.fg_dim },
    ["@tag"] = { fg = c.purple },
    ["@tag.attribute"] = { fg = c.yellow },
    ["@tag.delimiter"] = { fg = c.comment },

    -- Markdown (cheatsheet, READMEs)
    ["@markup.heading"] = { fg = c.blue, bold = true },
    ["@markup.link"] = { fg = c.cyan, underline = true },
    ["@markup.raw"] = { fg = c.green },
    ["@markup.list"] = { fg = c.purple },
  }
end
