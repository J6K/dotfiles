-- Core UI: windows, popups, search, statusline, diagnostics, diffs.
---@param c table palette
return function(c)
  return {
    Normal = { fg = c.fg, bg = c.bg },
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = c.fg, bg = c.bg_dark },
    FloatBorder = { fg = c.comment, bg = c.bg_dark },
    FloatTitle = { fg = c.blue, bg = c.bg_dark, bold = true },

    Cursor = { fg = c.bg, bg = c.terminal.cursor },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.yellow, bold = true },
    LineNr = { fg = c.line_nr },
    SignColumn = { fg = c.line_nr },
    ColorColumn = { bg = c.bg_highlight },
    Folded = { fg = c.comment, bg = c.bg_highlight },
    FoldColumn = { fg = c.line_nr },

    Visual = { bg = c.bg_visual },
    Search = { fg = c.bg, bg = c.yellow },
    IncSearch = { fg = c.bg, bg = c.red },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = c.bg, bg = c.purple },
    MatchParen = { fg = c.yellow, bg = c.border, bold = true },

    Pmenu = { fg = c.fg, bg = c.bg_dark },
    PmenuSel = { bg = c.bg_visual, bold = true },
    PmenuSbar = { bg = c.bg_dark },
    PmenuThumb = { bg = c.comment },

    StatusLine = { fg = c.fg_dim, bg = c.bg_dark },
    StatusLineNC = { fg = c.comment, bg = c.bg_dark },
    WinSeparator = { fg = c.border },
    TabLine = { fg = c.comment, bg = c.bg_dark },
    TabLineSel = { fg = c.fg, bg = c.bg, bold = true },
    TabLineFill = { bg = c.bg_dark },
    WinBar = { fg = c.fg_dim },
    WinBarNC = { fg = c.comment },

    NonText = { fg = c.border },
    Whitespace = { fg = c.border },
    SpecialKey = { fg = c.border },
    EndOfBuffer = { fg = c.bg },
    Conceal = { fg = c.comment },
    Directory = { fg = c.blue },
    Title = { fg = c.blue, bold = true },
    QuickFixLine = { bg = c.bg_highlight, bold = true },

    ErrorMsg = { fg = c.red, bold = true },
    WarningMsg = { fg = c.yellow },
    ModeMsg = { fg = c.green, bold = true },
    MoreMsg = { fg = c.green },
    Question = { fg = c.cyan },

    -- Diagnostics (LSP errors, warnings, ...)
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.cyan },
    DiagnosticHint = { fg = c.green },
    DiagnosticOk = { fg = c.green },
    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.cyan },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.green },
    LspReferenceText = { bg = c.border },
    LspReferenceRead = { bg = c.border },
    LspReferenceWrite = { bg = c.border, underline = true },
    LspInlayHint = { fg = c.comment, italic = true },

    -- Diffs and git signs
    DiffAdd = { bg = c.diff_add },
    DiffChange = { bg = c.diff_change },
    DiffDelete = { fg = c.red, bg = c.diff_delete },
    DiffText = { bg = c.diff_text },
    Added = { fg = c.green },
    Changed = { fg = c.blue },
    Removed = { fg = c.red },
  }
end
