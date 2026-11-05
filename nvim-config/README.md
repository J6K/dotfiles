# Your modernized Neovim config

## Install

One config for every OS. Platform differences are handled inside the Lua
(`vim.fn.has("mac")` / `has("win32")` checks), so there's nothing to fork.

### macOS / Linux

```bash
# back up anything existing first
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# put this folder in place
cp -r nvim-config ~/.config/nvim

# launch nvim - lazy.nvim bootstraps itself and installs every plugin
nvim
```

First launch will look busy for a minute while lazy.nvim clones plugins and
Mason downloads language servers. After that, startup is fast.

You'll also want these installed on your system (not nvim plugins):
- **Neovim 0.12+** (the LSP and treesitter setup use 0.11/0.12 APIs)
- **git** (lazy.nvim needs it)
- **ripgrep** (`brew install ripgrep`) — powers `<leader>g` grep search
- **Node.js** — Mason needs it for `pyright`, `ts_ls`, `bashls`
- **tree-sitter CLI + a C compiler** (`npm i -g tree-sitter-cli`; Xcode CLT
  provides `cc` via `xcode-select --install`) — to compile treesitter parsers
- **a Nerd Font** (e.g. `brew install --cask font-jetbrains-mono-nerd-font`) —
  for the icons in neo-tree / lualine / telescope

### Windows

Neovim on Windows reads its config from `%LOCALAPPDATA%\nvim`, not
`~/.config/nvim`. Link this folder there so edits in the repo apply live:

```powershell
# install neovim + tools
winget install Neovim.Neovim
winget install BurntSushi.ripgrep.MSVC
winget install OpenJS.NodeJS.LTS
winget install DEVCOM.JetBrainsMonoNerdFont   # then pick it in Windows Terminal

# back up anything existing, then link the repo folder in place
if (Test-Path "$env:LOCALAPPDATA\nvim") { Rename-Item "$env:LOCALAPPDATA\nvim" nvim.bak }
New-Item -ItemType Junction -Path "$env:LOCALAPPDATA\nvim" -Target "$HOME\code\dotfiles\nvim-config"

nvim
```

Plugins and Mason data live in `%LOCALAPPDATA%\nvim-data` (the equivalent of
`~/.local/share/nvim`).

**Optional compiled extras.** Stock Windows has no C compiler, and the
config works without one:

| Feature | Needs | Without it |
|---|---|---|
| Treesitter parsers (python, js, ts, …) | `tree-sitter` CLI (`npm i -g tree-sitter-cli`) + a C compiler (`winget install LLVM.LLVM`, or VS Build Tools) | Regex syntax highlighting. Neovim 0.12 bundles the lua/vim/vimdoc/markdown parsers, so those still get treesitter |
| telescope-fzf-native | `make` + `gcc` (e.g. `winget install BrechtSanders.WinLibs.POSIX.UCRT`) | Skipped; Telescope uses its built-in Lua sorter |

After installing a compiler, restart nvim (parsers install on startup) and run
`:Lazy build telescope-fzf-native.nvim`.

**Keymaps on Windows/Linux:** the Mac `<D-…>` (Cmd) shortcuts are only
defined on macOS. Elsewhere you get `<C-s>` to save. `<C-a>`/`<C-c>`/`<C-v>`
are left as Vim's increment / interrupt / visual-block. The clipboard already
works through `y`/`p` because of `clipboard=unnamedplus` (Neovim for Windows
ships `win32yank.exe`).

## What changed and why

| Old (vimrc / vim-plug) | New (init.lua / lazy.nvim) | Why |
|---|---|---|
| vim-plug | **lazy.nvim** | Faster, lazy-loads plugins, UI for managing/updating them |
| altercation/vim-colors-solarized | **indigo_clear** (local, no plugin) | Matches the Windows Terminal "Indigo Clear" scheme used by PowerShell |
| NERDTree | **neo-tree.nvim** | Git status, diagnostics, and a nicer UI built in |
| fzf / fzf.vim | **telescope.nvim** | Pure Lua, deeper LSP/git integration, no external binary except ripgrep |
| vim-airline | **lualine.nvim** | Faster, configured in Lua |
| vim-gitgutter | **gitsigns.nvim** | Async, adds hunk stage/preview/blame |
| coc.nvim | **mason.nvim + nvim-lspconfig + nvim-cmp** | Uses Neovim's built-in LSP client instead of a separate Node host; `mason.nvim` installs language servers for you (`:Mason` to browse) |
| vim-which-key | **which-key.nvim** | Same author's actively maintained successor; reads `desc` fields automatically |
| vim-surround | **nvim-surround** | Same keys (`ys`, `cs`, `ds`), treesitter-aware |
| vim-sensible | *(dropped)* | Neovim's built-in defaults already cover what it did |
| — | **nvim-treesitter** (`main` branch) | New: real syntax parsing instead of regex highlighting, better indent |

## Kept exactly as-is
- All your Mac keybindings (`<D-s>`, `<D-c>`, `<D-v>`, etc.), on macOS
- `<Space>` leader, `<C-hjkl>` window navigation, `<Esc>` to clear search
- Every `<leader>` mapping (`e`, `f`, `g`, `b`, `/`, `w`, `q`, `?`)
- The `<leader>?` cheatsheet (now in `lua/cheatsheet/`), with a new LSP
  section added since that's a new capability

## File layout

```
nvim-config/
├── init.lua                      entry point
├── colors/
│   └── indigo_clear.lua          `:colorscheme indigo_clear` hook
└── lua/
    ├── config/
    │   ├── platform.lua          OS checks (is_mac, is_windows, has(...))
    │   ├── options.lua           editor options
    │   ├── keymaps.lua           core keymaps + OS-specific shortcuts
    │   ├── autocmds.lua          yank highlight, trim trailing whitespace
    │   └── lazy.lua              plugin manager bootstrap
    ├── plugins/                  one lazy.nvim spec per file, with its keymaps
    │   ├── cmp.lua  git.lua  lsp.lua  neotree.lua  statusline.lua
    │   └── surround.lua  telescope.lua  treesitter.lua  whichkey.lua
    ├── indigo_clear/             the colorscheme
    │   ├── palette.lua           colors (copied from Windows Terminal)
    │   ├── init.lua              applies the groups below
    │   ├── util.lua              color blending
    │   └── groups/               editor.lua  syntax.lua  plugins.lua
    ├── lualine/themes/
    │   └── indigo_clear.lua      statusline colors
    └── cheatsheet/
        ├── sections.lua          cheatsheet content (just add rows)
        └── init.lua              renders it into a split
```

Where to change things:
- **Add a plugin:** drop a new file in `lua/plugins/`. It's loaded
  automatically, and its keymaps go in the spec's `keys` field.
- **Change a color:** edit `lua/indigo_clear/palette.lua`. Every highlight
  group derives from it.
- **Add an OS-specific tweak:** use `require("config.platform")`.

## One thing to double check
`lua/plugins/lsp.lua` installs `lua_ls`, `pyright`, `ts_ls`, and `bashls`
by default. Edit the `SERVERS` list at the top of that file to match the
languages you actually work in. mason-lspconfig installs and enables
whatever is listed. Run `:Mason` to see what's available.
