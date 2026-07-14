# Your modernized Neovim config

## Install

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
- **Neovim 0.9+** (0.10 recommended)
- **git** (lazy.nvim needs it)
- **ripgrep** (`brew install ripgrep`) — powers `<leader>g` grep search
- **a Nerd Font** (e.g. `brew install --cask font-jetbrains-mono-nerd-font`) —
  for the icons in neo-tree / lualine / telescope

## What changed and why

| Old (vimrc / vim-plug) | New (init.lua / lazy.nvim) | Why |
|---|---|---|
| vim-plug | **lazy.nvim** | Faster, lazy-loads plugins, UI for managing/updating them |
| altercation/vim-colors-solarized | **maxmx03/solarized.nvim** | Original is unmaintained; this one supports true colors properly |
| NERDTree | **neo-tree.nvim** | Git status, diagnostics, and a nicer UI built in |
| fzf / fzf.vim | **telescope.nvim** | Pure Lua, deeper LSP/git integration, no external binary except ripgrep |
| vim-airline | **lualine.nvim** | Faster, configured in Lua |
| vim-gitgutter | **gitsigns.nvim** | Async, adds hunk stage/preview/blame |
| coc.nvim | **mason.nvim + nvim-lspconfig + nvim-cmp** | Uses Neovim's built-in LSP client instead of a separate Node host; `mason.nvim` installs language servers for you (`:Mason` to browse) |
| vim-which-key | **which-key.nvim** | Same author's actively maintained successor; reads `desc` fields automatically |
| vim-surround | **nvim-surround** | Same keys (`ys`, `cs`, `ds`), treesitter-aware |
| vim-sensible | *(dropped)* | Neovim's built-in defaults already cover what it did |
| — | **nvim-treesitter** | New: real syntax parsing instead of regex highlighting, better indent |

## Kept exactly as-is
- All your Mac keybindings (`<D-s>`, `<D-c>`, `<D-v>`, etc.)
- `<Space>` leader, `<C-hjkl>` window navigation, `<Esc>` to clear search
- Every `<leader>` mapping (`e`, `f`, `g`, `b`, `/`, `w`, `q`, `?`)
- The `<leader>?` cheatsheet (now in `lua/config/cheatsheet.lua`), with a
  new LSP section added since that's a new capability

## File layout

```
~/.config/nvim/
├── init.lua                  entry point
└── lua/
    ├── config/
    │   ├── options.lua        set-equivalents
    │   ├── keymaps.lua        all your keybindings
    │   ├── autocmds.lua       yank highlight, trim trailing whitespace
    │   ├── cheatsheet.lua     <leader>? popup
    │   └── lazy.lua           plugin manager bootstrap
    └── plugins/
        ├── colorscheme.lua
        ├── telescope.lua
        ├── treesitter.lua
        ├── lsp.lua
        ├── cmp.lua
        ├── git.lua
        ├── statusline.lua
        ├── neotree.lua
        ├── whichkey.lua
        └── surround.lua
```

Each file in `lua/plugins/` returns a lazy.nvim plugin spec and is loaded
automatically — to add a plugin, just drop a new file in that folder.

## One thing to double check
`lua/plugins/lsp.lua` installs `lua_ls`, `pyright`, `tsserver`, and `bashls`
by default. Edit the `ensure_installed` list (in both `mason-lspconfig` and
the `lspconfig` loop) to match the languages you actually work in — run
`:Mason` afterward to see what's available.
