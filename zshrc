
# Functions
fpath=( "$HOME/.zsh/functions" $fpath )

# Settings
source ~/.zsh/settings.zsh

# Key bindings
source ~/.zsh/bindings.zsh

# Shell
for file in ~/.shell/*.sh; do source $file; done

# Plugins
source ~/.zsh/plugins.zsh

# Prompt
prompt pure
