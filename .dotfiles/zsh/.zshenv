#!/usr/bin/env zsh
# ~/.zshenv - Sourced for all shells (login, non-login, interactive, non-interactive)
# This file should contain environment variables and nothing that produces output
# or assumes an interactive shell

# XDG Base Directory Specification
# These ensure consistent locations for config, data, and cache files
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$HOME/.local/state}"


# Default programs
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"
export BROWSER="${BROWSER:-firefox}"

# Language and locale settings
export LANG="${LANG:-en_AU.UTF-8}"
export LC_ALL="${LC_ALL:-en_AU.UTF-8}"

# Path configuration
# Add user's private bin directories to PATH
typeset -U path  # Ensure unique entries in path

# User-specific binaries
path=(
    "$HOME/.local/bin"
    "$HOME/bin"
    $path
)

# Programming language specific paths
# Rust
if [[ -d "$HOME/.cargo/bin" ]]; then
    path=("$HOME/.cargo/bin" $path)
fi

# Go
if command -v go &> /dev/null; then
    export GOPATH="${GOPATH:-$HOME/go}"
    path=("$GOPATH/bin" $path)
fi

# Node.js (npm/yarn global binaries)
if [[ -d "$HOME/.npm-global/bin" ]]; then
    path=("$HOME/.npm-global/bin" $path)
fi

# Python
if [[ -d "$HOME/.local/bin" ]]; then
    # pip install --user installs here
    path=("$HOME/.local/bin" $path)
fi

# Ruby gems
if command -v ruby &> /dev/null && command -v gem &> /dev/null; then
    path=("$(ruby -e 'puts Gem.user_dir')/bin" $path)
fi

# macOS specific paths
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew paths (Apple Silicon)
    if [[ -d "/opt/homebrew" ]]; then
        path=("/opt/homebrew/bin" "/opt/homebrew/sbin" $path)
    fi
    # Homebrew paths (Intel)
    if [[ -d "/usr/local/homebrew" ]]; then
        path=("/usr/local/homebrew/bin" "/usr/local/homebrew/sbin" $path)
    fi
fi

# Less configuration
export LESS='-R -F -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"

# Man page colors (makes man pages more readable)
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# FZF configuration
export FZF_DEFAULT_OPTS='
    --height 40%
    --layout=reverse
    --border
    --inline-info
    --color=dark
    --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
    --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# History file location (XDG compliant)
export HISTFILE="${XDG_STATE_HOME}/zsh/history"

# Ensure required directories exist
[[ ! -d "${XDG_CONFIG_HOME}" ]] && mkdir -p "${XDG_CONFIG_HOME}"
[[ ! -d "${XDG_DATA_HOME}" ]] && mkdir -p "${XDG_DATA_HOME}"
[[ ! -d "${XDG_CACHE_HOME}" ]] && mkdir -p "${XDG_CACHE_HOME}"
[[ ! -d "${XDG_STATE_HOME}" ]] && mkdir -p "${XDG_STATE_HOME}"
[[ ! -d "${XDG_STATE_HOME}/zsh" ]] && mkdir -p "${XDG_STATE_HOME}/zsh"
[[ ! -d "${XDG_CACHE_HOME}/less" ]] && mkdir -p "${XDG_CACHE_HOME}/less"

# Development environment variables
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# Security: Disable core dumps
ulimit -c 0

# Export the modified PATH
export PATH
