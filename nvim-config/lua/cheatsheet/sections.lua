-- ============================
-- Cheatsheet content
-- Each section is { title, rows }, and each row is { keys, description }.
-- Columns are aligned automatically by cheatsheet/init.lua, so just add rows.
-- ============================
return {
  {
    "MOTIONS",
    {
      { "h j k l", "Left / Down / Up / Right" },
      { "w W", "Next word start (word / WORD)" },
      { "b B", "Prev word start (word / WORD)" },
      { "e E", "Next word end" },
      { "0  ^  $", "Line col-0 / first non-blank / end" },
      { "gg  G", "File start / end" },
      { "{  }", "Prev / next paragraph" },
      { "%", "Jump to matching bracket" },
      { "f{c}  F{c}", "Jump to char forward / backward on line" },
      { "t{c}  T{c}", "Jump before char forward / backward" },
      { ";  ,", "Repeat f/t forward / backward" },
      { "H  M  L", "High / Middle / Low of screen" },
      { "Ctrl-d  Ctrl-u", "Half page down / up" },
      { "Ctrl-f  Ctrl-b", "Full page down / up" },
    },
  },
  {
    "OPERATORS  (combine with motions or text objects)",
    {
      { "d", "Delete  (dd = whole line)" },
      { "c", "Change  (cc = whole line)" },
      { "y", "Yank    (yy = whole line)" },
      { ">  <", "Indent / unindent" },
      { "=", "Auto-indent" },
      { "gu  gU  g~", "Lowercase / uppercase / toggle case + motion" },
    },
  },
  {
    "TEXT OBJECTS  (use after d/c/y/v)",
    {
      { "iw  aw", "inner word / a word (includes space)" },
      { "is  as", "inner sentence / a sentence" },
      { "ip  ap", "inner paragraph / a paragraph" },
      { 'i"  a"', "inner / outer double quotes" },
      { "i'  a'", "inner / outer single quotes" },
      { "i(  a(", "inner / outer parens" },
      { "i{  a{", "inner / outer braces" },
      { "i[  a[", "inner / outer brackets" },
      { "it  at", "inner / outer HTML tag" },
      { "diw", "e.g. delete word under cursor" },
      { 'ci"', "e.g. change text inside quotes" },
      { "ya(", "e.g. yank everything inside+including parens" },
      { ">ip", "e.g. indent paragraph" },
    },
  },
  {
    "EDITING",
    {
      { "i  I", "Insert before cursor / line start" },
      { "a  A", "Append after cursor / line end" },
      { "o  O", "Open new line below / above" },
      { "r  R", "Replace one char / enter replace mode" },
      { "u  Ctrl-r", "Undo / Redo" },
      { ".", "Repeat last change  <- learn this one" },
      { "p  P", "Paste after / before cursor" },
      { "x  X", "Delete char under / before cursor" },
      { "J", "Join line with next" },
    },
  },
  {
    "SEARCH & REPLACE",
    {
      { "/pattern", "Search forward  (Enter to confirm)" },
      { "?pattern", "Search backward" },
      { "n  N", "Next / prev match" },
      { "*  #", "Search word under cursor fwd / bwd" },
      { ":s/old/new/g", "Replace in current line" },
      { ":%s/old/new/gc", "Replace in file  (c = confirm each)" },
    },
  },
  {
    "VISUAL MODE",
    {
      { "v  V  Ctrl-v", "Char / line / block select" },
      { "o", "Move to other end of selection" },
      { "gv", "Re-select last visual selection" },
    },
  },
  {
    "MARKS & JUMPS",
    {
      { "m{a-z}", "Set local mark" },
      { "'{a}  `{a}", "Jump to mark's line / exact position" },
      { "Ctrl-o  Ctrl-i", "Jump backward / forward in jump list" },
      { "gi", "Go to last insert position" },
    },
  },
  {
    "WINDOWS & BUFFERS",
    {
      { ":e file", "Open file" },
      { ":vs  :sp", "Vertical / horizontal split" },
      { "Ctrl-h/j/k/l", "Navigate windows  (custom)" },
      { ":bn  :bp", "Next / prev buffer" },
      { ":bd", "Delete (close) buffer" },
    },
  },
  {
    "REGISTERS",
    {
      { '"{r}y  "{r}p', "Yank / paste using register {r}" },
      { '"+y  "+p', "System clipboard" },
      { ":reg", "Show all registers" },
      { '"0', "Last yank (not overwritten by delete)" },
    },
  },
  {
    "MACROS",
    {
      { "q{a-z}", "Start recording into register" },
      { "q", "Stop recording" },
      { "@{a}", "Play macro" },
      { "@@", "Replay last macro" },
      { "5@@", "Play last macro 5 times" },
    },
  },
  {
    "LSP",
    {
      { "gd", "Go to definition" },
      { "gr", "Go to references" },
      { "K", "Hover docs" },
      { "<leader>rn", "Rename symbol" },
      { "<leader>ca", "Code action" },
      { "]d  [d", "Next / prev diagnostic" },
    },
  },
  {
    "YOUR LEADER MAPPINGS  (<Space>, press alone for which-key)",
    {
      { "<leader>?", "This cheatsheet  <- you are here" },
      { "<leader>e", "Toggle file explorer (neo-tree)" },
      { "<leader>f", "Fuzzy find files (Telescope)" },
      { "<leader>g", "Grep search (Telescope live_grep)" },
      { "<leader>b", "List open buffers" },
      { "<leader>/", "Search lines in buffer" },
      { "<leader>w", "Save file" },
      { "<leader>q", "Quit" },
    },
  },
}
