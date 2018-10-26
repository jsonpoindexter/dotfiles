
# Functions
fpath=( "$HOME/.zsh/functions" "/usr/local/share/zsh-completions" $fpath )

# Extend $PATH to allow for ~/.bin
PATH=$PATH:"$HOME/.bin"

# Settings
source ~/.zsh/settings.zsh

# Plugins
source ~/.zsh/plugins.zsh

# Key bindings
source ~/.zsh/bindings.zsh

# Shell
for file in ~/.shell/*.sh; do source $file; done

# Prompt
prompt pure
