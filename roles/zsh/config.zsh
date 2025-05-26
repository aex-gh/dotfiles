# Disable autocorrect
DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all

# Don't auto-cd into directories without typing cd
# because can annoyingly put you into source directories for CLI projects
unsetopt AUTO_CD

# Set history options
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file  
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry
setopt HIST_VERIFY             # Don't execute immediately upon history expansion
setopt EXTENDED_HISTORY        # Write the history file in the ":start:elapsed;command" format
setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY           # Share history between all sessions

# Additional useful options
setopt AUTO_PUSHD              # Push the current directory visited on the stack
setopt PUSHD_IGNORE_DUPS       # Do not store duplicates in the stack
setopt PUSHD_SILENT            # Do not print the directory stack after pushd or popd
