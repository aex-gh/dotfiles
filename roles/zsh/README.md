# Zsh Role

This role installs and configures Zsh with XDG Base Directory Specification compliance and cross-platform support, optionally with Prezto framework.

## Features

- **XDG Compliance**: All zsh files are stored in XDG-compliant directories:
  - Config: `$XDG_CONFIG_HOME/zsh/` (default: `~/.config/zsh/`)
  - Data: `$XDG_DATA_HOME/zsh/` (default: `~/.local/share/zsh/`)
  - State: `$XDG_STATE_HOME/zsh/` (default: `~/.local/state/zsh/`)
  - Cache: `$XDG_CACHE_HOME/zsh/` (default: `~/.cache/zsh/`)

- **Cross-platform Support**: 
  - macOS (via Homebrew, with path_helper fix)
  - Ubuntu/Debian (via apt)
  - Arch Linux (via pacman)

- **Prezto Integration**: Optional Prezto framework with XDG-compliant installation
- **Legacy Compatibility**: Creates symlinks for backwards compatibility with legacy `~/.zshrc`
- **Modular Configuration**: Loads configuration from dotfiles roles automatically

## Configuration

### XDG Directory Structure

```
~/.config/zsh/
├── .zshrc              # Main zsh configuration
├── .zpreztorc          # Prezto configuration (if enabled)
├── .zprezto/           # Prezto installation (if enabled)
└── localrc             # Local machine-specific config

~/.local/state/zsh/
├── history             # Zsh history file
└── ...                 # Other state files

~/.cache/zsh/
└── zcompdump          # Completion cache
```

### Environment Variables Set

- `ZDOTDIR`: Points to `$XDG_CONFIG_HOME/zsh`
- `HISTFILE`: Points to `$XDG_STATE_HOME/zsh/history`
- XDG Base Directory variables (if not already set)
- Various application history files are redirected to XDG locations

### Prezto Configuration

When enabled, Prezto is configured with:
- Pure theme
- Git integration
- Python virtual environment auto-switching
- Autosuggestions
- Syntax highlighting (via configuration)

## Variables

- `zsh_prezto`: Enable Prezto framework (default: `true`)
- `set_zsh_as_default`: Set zsh as the default shell (default: `true`)
- `dotfiles_repo_url`: URL of your dotfiles repository for remote installation

## Modular Loading

The zshrc automatically loads configuration files from your dotfiles roles in this order:

1. `*/path.zsh` - PATH modifications
2. `*/_env.zsh` - Environment variables  
3. `*/aliases.zsh` - Aliases
4. `*/config.zsh` - Configuration
5. `*/completion.zsh` - Completions (after compinit)
6. `*/final.zsh` - Final configuration

## Shell Options

The configuration sets sensible shell options including:
- Enhanced history management (no duplicates, immediate append, sharing)
- Auto-pushd for directory stack management
- Disabled auto-correction and auto-cd

## Aliases

Common aliases are provided:
- `c`, `cl`: clear
- `v`, `vi`: vim
- `reload!`: reload zsh configuration
- XDG-compliant versions of commands (e.g., wget)

## Usage

The role will:

1. Install zsh for the target platform
2. Set up XDG-compliant directories
3. Install and configure Prezto (if enabled)
4. Set up modular configuration loading
5. Create legacy compatibility symlinks
6. Set zsh as default shell (if enabled)
7. Configure system-wide ZDOTDIR environment variable

## Platform-Specific Notes

### macOS
- Fixes broken `/etc/zshenv` that interferes with PATH ordering
- Supports both Intel and Apple Silicon homebrew paths
- Sets ZDOTDIR in `/etc/zshenv`

### Linux
- Sets ZDOTDIR in `/etc/zsh/zshenv`
- Supports apt (Debian/Ubuntu) and pacman (Arch) package managers

## Local Configuration

For machine-specific configuration that shouldn't be in version control:
- Legacy: `~/.localrc`
- XDG: `$XDG_CONFIG_HOME/zsh/localrc`

Both files are sourced if they exist, allowing for a smooth transition.

## History Management

History is managed with XDG compliance:
- Stored in `$XDG_STATE_HOME/zsh/history`
- No duplicates, immediate append to file
- Shared between all zsh sessions
- Ignores commands starting with space
