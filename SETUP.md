# Enhanced Dotfiles V6

This directory contains an enhanced version of the dotfiles with the following improvements:

## New Features

### 🔄 Cross-Platform Support
- **macOS** (primary platform)
- **Ubuntu** (most popular Linux desktop)
- **Debian** (stable foundation)
- **Fedora** (latest packages)
- **Arch Linux** (rolling release)

### 📁 XDG Base Directory Compliance
- Clean home directory
- Configs in `~/.config`
- Data in `~/.local/share`
- Cache in `~/.cache`

### 🛠 Modern CLI Tools
- Enhanced package management
- Intelligent fallbacks
- Cross-platform font installation
- Better error handling

## Setup Instructions

1. **Set permissions:**
   ```bash
   bash setup_permissions.sh
   ```

2. **Copy original files:**
   Follow the `COPY_FROM_ORIGINAL.md` guides in each role directory

3. **Configure:**
   Edit `group_vars/local` with your information

4. **Install:**
   ```bash
   ./bin/dot-bootstrap
   ```

## Manual Copying Required

The following files need to be manually copied from the original repository:
- `roles/zsh/` - Shell configuration
- `roles/git/` - Git templates and configs  
- `roles/vim/` - Editor configuration
- `roles/python/` - Python environment
- `roles/mise/` - Version manager
- `roles/rust/` - Rust toolchain
- `roles/macos/` - macOS-specific settings
- `roles/docker/` - Container tools
- `misc/` - Terminal themes and extras

Each directory contains a `COPY_FROM_ORIGINAL.md` file with specific instructions.
