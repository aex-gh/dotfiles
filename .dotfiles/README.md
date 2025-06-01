# Zsh Configuration Files

This repository contains a comprehensive Zsh configuration setup that works across macOS and Linux distributions (Arch, Ubuntu, Debian, Fedora).

## File Structure and Loading Order

Zsh loads configuration files in a specific order depending on the shell type:

1. **For all shells:**
   - `/etc/zshenv` → `~/.zshenv`

2. **For login shells:**
   - `/etc/zprofile` → `~/.zprofile` → `/etc/zshrc` → `~/.zshrc` → `/etc/zlogin` → `~/.zlogin`

3. **For interactive shells:**
   - `/etc/zshrc` → `~/.zshrc`

4. **For login shells on logout:**
   - `~/.zlogout` → `/etc/zlogout`

## Configuration Files

### ~/.zshenv
- **Purpose**: Define environment variables available to ALL Zsh instances
- **Contents**: PATH modifications, default programs, XDG directories
- **Note**: Should not contain commands that produce output or require an interactive shell

### /etc/zprofile
- **Purpose**: System-wide login shell configurations
- **Contents**: System PATH additions, security settings, OS-specific system configurations
- **Note**: Requires root/sudo access to modify

### ~/.zprofile
- **Purpose**: User-specific login shell configurations
- **Contents**: Programming language version managers, user-specific PATH additions, development environment setup
- **Note**: Loaded before .zshrc for login shells

### ~/.zshrc
- **Purpose**: Interactive shell configurations
- **Contents**: Plugins, aliases, completions, prompt configuration, key bindings
- **Note**: The main configuration file for interactive use

### ~/.zlogin
- **Purpose**: Commands to run after all configurations are loaded for login shells
- **Contents**: Welcome messages, system information display, update checks, SSH agent startup
- **Note**: Good for commands that should only run once per login

## Installation

### Using GNU Stow (Recommended)

1. Clone this repository to your dotfiles directory:
   ```bash
   git clone <repository-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Use stow to create symlinks:
   ```bash
   stow -v zsh
   ```

3. For system-wide configurations (requires root):
   ```bash
   sudo cp zsh/etc/zprofile /etc/zprofile
   ```

### Manual Installation

1. Back up existing configurations:
   ```bash
   for file in .zshenv .zprofile .zshrc .zlogin; do
       [[ -f ~/$file ]] && mv ~/$file ~/$file.backup
   done
   ```

2. Copy or symlink the configuration files:
   ```bash
   cp <path-to-config>/.zshenv ~/.zshenv
   cp <path-to-config>/.zprofile ~/.zprofile
   cp <path-to-config>/.zshrc ~/.zshrc
   cp <path-to-config>/.zlogin ~/.zlogin
   ```

## OS-Specific Considerations

### macOS
- Homebrew paths are automatically detected and added
- GNU coreutils are preferred when available
- Terminal.app and iTerm2 color support is enabled
- System integrity protection (SIP) prevents modification of some system files

### Linux (All Distributions)
- XDG Base Directory Specification is fully supported
- Flatpak and Snap paths are added when detected
- systemd editor preferences are set

### Arch Linux
- AUR helper (yay, paru) completions work with the configuration
- pacman/yay/paru aliases can be added to .zshrc
- Update notifications in .zlogin use `checkupdates`

### Ubuntu/Debian
- apt update reminders in .zlogin
- Snap integration is automatic
- Default system paths are preserved

### Fedora
- DNF completions work with the configuration
- RPM Fusion paths are respected
- SELinux contexts are preserved when using stow

## Customization

### Local Overrides
Create these files for machine-specific configurations:
- `~/.zshenv.local` - Local environment variables
- `~/.zshrc.local` - Local aliases and functions
- `~/.zprofile.local` - Local login configurations

### Plugin Management
The main .zshrc uses Zinit for plugin management. To add more plugins:
```bash
# In ~/.zshrc
zinit light <github-user>/<repository>
```

### Theme Configuration
Run `p10k configure` to customize the Powerlevel10k prompt.

## Troubleshooting

### Slow Shell Startup
1. Profile your configuration:
   ```bash
   time zsh -i -c exit
   ```

2. Check for slow plugins:
   ```bash
   zsh -xv 2>&1 | ts -i "%.s"
   ```

### PATH Issues
- Check path order: `echo $PATH | tr ':' '\n'`
- Ensure no duplicates: The configuration uses `typeset -U path`

### Permission Errors
- Ensure XDG directories exist with correct permissions
- Check if system files need sudo access

## Best Practices

1. **Keep .zshenv minimal**: Only environment variables, no interactive commands
2. **Use .zshrc for interactive features**: Aliases, completions, prompt
3. **Put one-time login commands in .zlogin**: System info, update checks
4. **Use XDG directories**: Keep $HOME clean by using standard directories
5. **Document custom changes**: Add comments explaining non-obvious configurations

## Dependencies

### Required
- Zsh 5.0 or higher
- Git (for Zinit and plugin installation)

### Recommended
- [Zinit](https://github.com/zdharma-continuum/zinit) - Plugin manager
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Prompt theme
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) - Smarter cd command
- [Neovim](https://neovim.io/) - Modern vim fork

### Optional
- fastfetch/neofetch - System information display
- GNU coreutils - Better Unix utilities on macOS
- ssh-agent - SSH key management
- gpg-agent - GPG key management

## Recommended directory structure
Recommended directory structure for stow-based dotfile management:

```
~/.dotfiles/
├── .stowrc                    # Stow configuration (in repo root)
├── README.md                  # Main documentation
├── install.sh                 # Optional installation script
├── zsh/                       # Zsh package
│   ├── .zshenv
│   ├── .zprofile
│   ├── .zshrc
│   ├── .zlogin
│   ├── .zlogout              # Optional logout script
│   └── .config/
│       └── zsh/
│           ├── aliases.zsh    # Modular alias definitions
│           ├── functions.zsh  # Custom functions
│           ├── completions/   # Custom completions
│           └── .zshrc.local   # Machine-specific configs
├── git/                       # Git package
│   ├── .gitconfig
│   └── .gitignore_global
├── nvim/                      # Neovim package
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           └── lua/
├── tmux/                      # Tmux package
│   ├── .tmux.conf
│   └── .config/
│       └── tmux/
│           └── tmux.conf
├── ssh/                       # SSH package (be careful with permissions!)
│   └── .ssh/
│       └── config
├── bin/                       # Personal scripts
│   └── .local/
│       └── bin/
│           ├── script1
│           └── script2
└── system/                    # System-wide configs (requires sudo)
    └── etc/
        └── zprofile

Usage:
1. Clone the repository:
   git clone <your-repo> ~/.dotfiles
   cd ~/.dotfiles

2. Install individual packages:
   stow zsh
   stow git
   stow nvim

3. Install all packages:
   stow */

4. Uninstall a package:
   stow -D zsh

5. Reinstall (useful after adding new files):
   stow -R zsh

6. Check what would be done (dry run):
   stow -n -v zsh

7. Handle conflicts:
   # If files already exist, back them up first
   mv ~/.zshrc ~/.zshrc.backup
   stow zsh

8. System-wide files (requires root):
   sudo cp system/etc/zprofile /etc/zprofile

Notes:
- Each directory at the root level is a "package" in stow terminology
- The directory structure inside each package mirrors where files should be placed relative to $HOME
- Use .config/ subdirectories for XDG-compliant applications
- Keep sensitive files (like private keys) out of version control
- Consider using git-crypt or similar for files that must be private

## License

These configuration files are provided as-is for public use. Feel free to modify and distribute as needed.
