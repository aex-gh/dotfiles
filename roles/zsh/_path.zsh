# Prepend ~/dotfiles/bin to PATH
export PATH="$ZSH/bin:$PATH"

# Add user's local bin to PATH if it exists
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# Add XDG data home bin to PATH if it exists
[[ -d "$XDG_DATA_HOME/bin" ]] && export PATH="$XDG_DATA_HOME/bin:$PATH"
