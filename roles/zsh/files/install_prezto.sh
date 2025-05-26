#!/usr/bin/env zsh
# Prezto installation with XDG compliance
# see https://github.com/sorin-ionescu/prezto

# Set ZDOTDIR if not already set
if [[ -z "$ZDOTDIR" ]]; then
    export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
fi

# Ensure ZDOTDIR exists
mkdir -p "$ZDOTDIR"

# Clone Prezto to XDG config directory
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$ZDOTDIR/.zprezto"

# Link Prezto configuration files
setopt EXTENDED_GLOB
for rcfile in "$ZDOTDIR"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "$ZDOTDIR/.${rcfile:t}"
done
