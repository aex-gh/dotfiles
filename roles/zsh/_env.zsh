export TERM=xterm-256color
export EDITOR='vim'
export VISUAL='code'
export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Set ZDOTDIR for zsh configuration
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Settings for various CLIs with XDG compliance where possible
export PED_EDITOR='vim'
export KONCH_EDITOR='vim'
export FAM_SOURCE="$HOME/iCloud/fam"
export FAM_EDITOR="vim"
export AWS_CLI_AUTO_PROMPT=on-partial

# XDG-compliant application data directories
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export MYSQL_HISTFILE="$XDG_STATE_HOME/mysql/history"
export PSQL_HISTORY="$XDG_STATE_HOME/psql/history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite/history"
export REDISCLI_HISTFILE="$XDG_STATE_HOME/redis/history"

# Ensure state directories exist
[[ ! -d "$(dirname "$LESSHISTFILE")" ]] && mkdir -p "$(dirname "$LESSHISTFILE")"
[[ ! -d "$(dirname "$MYSQL_HISTFILE")" ]] && mkdir -p "$(dirname "$MYSQL_HISTFILE")"
[[ ! -d "$(dirname "$PSQL_HISTORY")" ]] && mkdir -p "$(dirname "$PSQL_HISTORY")"
[[ ! -d "$(dirname "$SQLITE_HISTORY")" ]] && mkdir -p "$(dirname "$SQLITE_HISTORY")"
[[ ! -d "$(dirname "$REDISCLI_HISTFILE")" ]] && mkdir -p "$(dirname "$REDISCLI_HISTFILE")"
