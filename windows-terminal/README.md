# Windows Terminal: Indigo Clear

An indigo and white colour scheme made for red-green colour confusion:

- **Background and text:** deep indigo `#1E1B4B` with near-white `#F4F4FF`.
- **Errors and success:** errors (the `red` slot) are orange and success (`green`) is a minty teal, so they differ on the blue-orange axis and in lightness, not only in hue.
- **Purple:** pushed to pink so it can't be mistaken for blue.

The Neovim theme (`nvim-config/lua/indigo_clear/palette.lua`) copies these colours as its `terminal` table. If you change a colour here, change it there too.

## Install

1. Open Windows Terminal's settings file: Settings (Ctrl+,), then **Open JSON file** at the bottom left. It lives at
   `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`.
2. Copy the object inside `"schemes"` in `indigo-clear.json` into the `"schemes"` list of your settings file.
3. Use it on a profile, e.g. Windows PowerShell:

   ```json
   {
       "colorScheme": "Indigo Clear",
       "commandline": "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
       "name": "Windows PowerShell"
   }
   ```

   Or pick it under Settings → the profile → Appearance → Color scheme.

Windows Terminal reloads the file on save, so open tabs change straight away.
