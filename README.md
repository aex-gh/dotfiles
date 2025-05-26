# Cross-Platform Development Environment

## Supported Platforms

### Primary Platforms (Full Support)
- **macOS** - Premium development experience, primary target
- **Ubuntu** - Most popular Linux desktop, excellent hardware support, WSL default

### Secondary Platforms (Good Support)  
- **Debian** - Stable foundation, excellent package management
- **Fedora** - Latest packages, developer-focused, Red Hat backing
- **Arch Linux** - Rolling release, AUR, advanced users

## Platform Selection Rationale

### Why These Five?

1. **Market Coverage**: These cover ~95% of development workstations
2. **Package Availability**: All have good modern CLI tool support
3. **Community Size**: Large communities mean better support
4. **Maintenance Burden**: Manageable number of platforms

### Why Not Others?

- **RHEL/CentOS/Rocky/Alma**: Enterprise server distros, complex setup
- **openSUSE**: Smaller community, different package management
- **Elementary/Pop!_OS/Mint**: Ubuntu derivatives, covered by Ubuntu support
- **Gentoo**: Too specialized, compilation-heavy

## Installation Complexity by Platform

### Tier 1 (Easiest)
- **macOS**: Homebrew has everything
- **Arch**: AUR has everything
- **Fedora**: Modern repos have most tools

### Tier 2 (Moderate)
- **Ubuntu**: Most tools available, some need PPAs/manual install
- **Debian**: Stable repos, some tools need manual install

## Package Availability Matrix

| Tool     | macOS | Ubuntu | Debian | Fedora | Arch |
|----------|-------|--------|--------|--------|------|
| git      | ✅     | ✅      | ✅      | ✅      | ✅    |
| vim      | ✅     | ✅      | ✅      | ✅      | ✅    |
| ripgrep  | ✅     | ✅      | ✅      | ✅      | ✅    |
| fd       | ✅     | ✅      | ✅      | ✅      | ✅    |
| bat      | ✅     | ✅      | ✅      | ✅      | ✅    |
| eza      | ✅     | ⚠️*     | ❌**    | ✅      | ✅    |
| fzf      | ✅     | ✅      | ✅      | ✅      | ✅    |
| mise     | ✅     | ❌**    | ❌**    | ❌**    | ⚠️*   |

*✅ = In standard repos*  
*⚠️ = Available via alternative method (PPA, AUR, etc.)*  
*❌ = Requires manual installation*

## Features

### Core Development Tools
- **Shell**: zsh with Prezto framework
- **Editor**: Vim with vim-plug and extensive configuration
- **Version Control**: Git with comprehensive aliases and GitHub integration
- **Python**: uv for package/environment management
- **Node.js**: mise for version management
- **Search/Navigation**: ripgrep (rg), fzf, eza, bat
- **Containers**: Docker aliases and utilities

### XDG Base Directory Compliance
- Follows XDG Base Directory Specification
- Clean home directory with configs in `~/.config`
- Data files in `~/.local/share`
- Cache files in `~/.cache`

### Cross-Platform Package Management
- Intelligent platform detection
- Unified package installation across distributions
- Fallback methods for packages not in standard repos

## Prerequisites

### Ubuntu/Debian
```bash
sudo apt update && sudo apt install git ansible
```

### Fedora
```bash
sudo dnf install git ansible
```

### Arch Linux
```bash
sudo pacman -S git ansible
```

### macOS
```bash
brew install git ansible
```

## Installation

```bash
# Clone dotfiles
git clone https://github.com/YOU/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Edit configuration
vim group_vars/local

# Run installation
./bin/dot-bootstrap
```

## Updates

```bash
# Update everything
dot-update

# Update specific roles
dot-update git python vim
```

## Configuration

Edit `group_vars/local` to customize:
- Personal information (name, email)
- Package lists for your platform
- Optional features and applications

## License

MIT Licensed.
