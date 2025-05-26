# Vim Role

This role installs and configures Vim with XDG Base Directory Specification compliance and cross-platform support.

## Features

- **XDG Compliance**: All vim files are stored in XDG-compliant directories:
  - Config: `$XDG_CONFIG_HOME/vim/` (default: `~/.config/vim/`)
  - Data: `$XDG_DATA_HOME/vim/` (default: `~/.local/share/vim/`)
  - State: `$XDG_STATE_HOME/vim/` (default: `~/.local/state/vim/`)
  - Cache: `$XDG_CACHE_HOME/vim/` (default: `~/.cache/vim/`)

- **Cross-platform Support**: 
  - macOS (via Homebrew)
  - Ubuntu/Debian (via apt)
  - Arch Linux (via pacman)

- **Plugin Management**: Uses vim-plug for plugin management
- **Custom Snippets**: Includes Python, JavaScript, and reStructuredText snippets
- **Legacy Compatibility**: Creates symlinks for backwards compatibility with legacy `~/.vimrc`

## Configuration

The main configuration file is located at `$XDG_CONFIG_HOME/vim/vimrc` with XDG-compliant directory settings.

### Key Bindings

- Leader key: `<Space>`
- `<Space>w`: Write file
- `<Space>q`: Quit
- `<Space>d`: Toggle NERDTree
- `<Space>/`: Toggle comment
- `<C-f>f`: Search in project
- `<Space>=`: Fix code with ALE
- `gd`: Go to definition

### Plugins Included

- **Essential**: vim-sensible, ctrlp.vim, nerdtree, ale (linting/fixing)
- **Git**: vim-fugitive, vim-gitgutter, vim-rhubarb
- **Language Support**: vim-polyglot, ultisnips
- **Productivity**: vim-surround, vim-commentary, vim-test

## Variables

- `vim_install_plugins`: Whether to automatically install plugins (default: false)

## XDG Directory Structure

```
~/.config/vim/
├── vimrc              # Main configuration
└── UltiSnips/         # Custom snippets
    ├── python.snippets
    ├── javascript.snippets
    └── rst.snippets

~/.local/share/vim/
├── autoload/
│   └── plug.vim       # vim-plug plugin manager
└── plugged/           # Installed plugins

~/.local/state/vim/
├── backup/            # Backup files
├── swap/              # Swap files
├── undo/              # Undo files
├── view/              # View files
└── viminfo            # Vim info file
```

## Usage

The role will:

1. Install vim and required dependencies
2. Set up XDG-compliant directories
3. Install vim-plug plugin manager
4. Symlink configuration and snippet files
5. Create legacy compatibility symlinks
6. Optionally install plugins (if `vim_install_plugins` is true)

## Notes

- The configuration maintains backwards compatibility by creating a symlink from `~/.vimrc` to the XDG location
- All plugin data, swap files, and other vim-generated files are stored in appropriate XDG directories
- The role handles existing configurations by backing them up before installing
