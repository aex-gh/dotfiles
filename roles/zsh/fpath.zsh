# Add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSH/roles/*); do
  if [[ -d $topic_folder ]]; then
    fpath=($topic_folder $fpath)
  fi
done

# Add XDG-compliant function directories to fpath
if [[ -d "$XDG_DATA_HOME/zsh/functions" ]]; then
  fpath=("$XDG_DATA_HOME/zsh/functions" $fpath)
fi

if [[ -d "$XDG_CONFIG_HOME/zsh/functions" ]]; then
  fpath=("$XDG_CONFIG_HOME/zsh/functions" $fpath)
fi
