#!/usr/bin/env zsh
# ~/.zprofile - User-specific login shell configurations
# This file is sourced after /etc/zprofile and before ~/.zshrc for login shells

# Create user directories based on XDG Base Directory Specification
# These might have been set in .zshenv, but ensure they exist
for dir in "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME" "$XDG_STATE_HOME"; do
    [[ ! -d "$dir" ]] && mkdir -p "$dir"
done

# Additional user directories
for dir in "$HOME/.local/bin" "$HOME/bin" "$HOME/Documents" "$HOME/Downloads" "$HOME/Projects"; do
    [[ ! -d "$dir" ]] && mkdir -p "$dir"
done

# Load any machine-specific environment variables
if [[ -f "$HOME/.zshenv.local" ]]; then
    source "$HOME/.zshenv.local"
fi

# Programming language version managers
# These need to be loaded before the shell is fully interactive

# Node Version Manager (nvm)
export NVM_DIR="${XDG_DATA_HOME}/nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
elif [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]]; then
    # macOS with Homebrew
    source "/opt/homebrew/opt/nvm/nvm.sh"
fi

# Ruby Version Manager (rbenv or rvm)
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - zsh)"
elif [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi

# Python environment management (pyenv)
if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
    eval "$(pyenv init -)"
    # Load pyenv-virtualenv if it exists
    if command -v pyenv-virtualenv-init &> /dev/null; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# Java version management (jenv)
if command -v jenv &> /dev/null; then
    eval "$(jenv init -)"
fi

# Rust environment
if [[ -f "$HOME/.cargo/env" ]]; then
    source "$HOME/.cargo/env"
fi

# macOS specific login configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Add GNU coreutils to PATH if installed via Homebrew
    if [[ -d "/opt/homebrew/opt/coreutils/libexec/gnubin" ]]; then
        path=("/opt/homebrew/opt/coreutils/libexec/gnubin" $path)
    elif [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
        path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
    fi
    
    # Use GNU sed if available
    if [[ -d "/opt/homebrew/opt/gnu-sed/libexec/gnubin" ]]; then
        path=("/opt/homebrew/opt/gnu-sed/libexec/gnubin" $path)
    fi
fi

# Linux specific login configurations
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Flatpak applications
    if [[ -d "/var/lib/flatpak/exports/bin" ]]; then
        path=("/var/lib/flatpak/exports/bin" $path)
    fi
    if [[ -d "$HOME/.local/share/flatpak/exports/bin" ]]; then
        path=("$HOME/.local/share/flatpak/exports/bin" $path)
    fi
    
    # Snap applications
    if [[ -d "/snap/bin" ]]; then
        path=("/snap/bin" $path)
    fi
fi

# GPG configuration for SSH authentication
if command -v gpgconf &> /dev/null; then
    export GPG_TTY=$(tty)
    # Start gpg-agent if not running
    gpgconf --launch gpg-agent 2> /dev/null
fi

# Compilation flags for optimized builds
export ARCHFLAGS="-arch $(uname -m)"

# Development database URLs (examples - modify as needed)
# export DATABASE_URL="postgresql://localhost/myapp_development"
# export REDIS_URL="redis://localhost:6379"

# Cloud provider credentials (examples - modify as needed)
# export AWS_PROFILE="default"
# export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"

# Export the final PATH
export PATH
