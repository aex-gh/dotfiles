#!/usr/bin/env zsh
# ~/.zlogin - Executed for login shells after .zshrc
# This file is sourced only for login shells, making it ideal for:
# - Starting background services
# - Displaying system information
# - Running commands that should only execute once per login

# Source any machine-specific login configurations
if [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zlogin.local" ]]; then
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zlogin.local"
fi

# Display system information on login (optional - comment out if not desired)
if command -v fastfetch &> /dev/null; then
# Modern system info tool
fastfetch
elif command -v neofetch &> /dev/null; then
# Alternative system info tool
neofetch
elif command -v screenfetch &> /dev/null; then
# Another alternative
screenfetch
fi

# Display last login information (macOS specific)
if [[ "$OSTYPE" == "darwin"* ]]; then
# macOS displays this automatically via terminal
:
else
# Linux systems - display last login
if command -v last &> /dev/null; then
echo "Last login: $(last -1 -R $USER | head -1 | awk '{print $3, $4, $5, $6}')"
fi
fi

# Check for system updates (optional - comment out if not desired)
if [[ "$OSTYPE" == "darwin"* ]] && command -v brew &> /dev/null; then
# macOS with Homebrew
echo "Checking for Homebrew updates..."
brew update --auto-update &> /dev/null &
elif [[ -f /etc/arch-release ]] && command -v checkupdates &> /dev/null; then
# Arch Linux
updates=$(checkupdates 2> /dev/null | wc -l)
if [[ $updates -gt 0 ]]; then
echo "There are $updates package updates available."
fi
elif command -v apt &> /dev/null; then
# Debian/Ubuntu
if [[ $(find /var/cache/apt/pkgcache.bin -mtime +1 2> /dev/null) ]]; then
echo "Package list might be outdated. Consider running 'sudo apt update'."
fi
fi

# # Start ssh-agent if not already running (Linux only)
# # macOS handles this automatically via Keychain
# if [[ "$(uname)" != "Darwin" ]]; then
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
# eval "$(ssh-agent -s)" > /dev/null
# fi
# fi

# Start ssh-agent if not already running
if [[ -z "$SSH_AUTH_SOCK" ]]; then
eval "$(ssh-agent -s)" > /dev/null 2>&1
fi

# Clear any completed background jobs
jobs -l 2> /dev/null | grep -E "Done|Exit" > /dev/null && jobs -l

#Custom welcome message
echo "Welcome to $(hostname), $USER!"
echo "Current time: $(date '+%Y-%m-%d %H:%M:%S')"
fortune
