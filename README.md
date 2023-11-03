# dotfiles

## Dotfile Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

```bash
source init
```

.zshrc is configured to source all files found within the .zsh directory. Files are categorized by extensions and shortcuts.

**Note:** Make sure to add any sensitive files to your .gitignore

## Additional Scripts

### Homebrew Formulae

Update commonly used homebrew formulae

```bash
sh scripts/brew.sh
```

### MacOS Preferences

Update commonly used Mac OS preferences

```bash
sh scripts/macos.sh
```
