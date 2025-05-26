# XDG-compliant Rust environment loading
# Use XDG_DATA_HOME for cargo installation
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"

# Add cargo binaries to PATH
export PATH="$CARGO_HOME/bin:$PATH"
