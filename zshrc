
# Plugins (managed through zplug)
# ==============================================================================

source ~/.zplug/init.zsh

# Determine current machine
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=darwin;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Contains some useful stuff like up-arrow search
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/key-bindings.zsh
zplug "lib/key-bindings", from:oh-my-zsh

# clipcopy & clippaste
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/clipboard.zsh
zplug "lib/clipboard", from:oh-my-zsh

# Turn on colors for all prezto modules
zstyle ':prezto:*:*' color 'yes'

# https://github.com/sorin-ionescu/prezto/blob/master/modules/environment/init.zsh
zplug "modules/environment", from:prezto

# Various aliases of general "utility"
# https://github.com/sorin-ionescu/prezto/tree/master/modules/utility
zplug "modules/utility", from:prezto

# Command completion
# https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
zplug "modules/completion", from:prezto

# Command history
# https://github.com/sorin-ionescu/prezto/blob/master/modules/history/init.zsh
zplug "modules/history", from:prezto
unsetopt BANG_HIST # Do not perform textual expansion of `!`
unsetopt SHARE_HISTORY # Do not share history between running sessions

# Directory options
setopt AUTO_PUSHD           # History stack
setopt PUSHD_IGNORE_DUPS    # Ignore duplicates in stack
setopt PUSHD_SILENT         # Be quiet about it
setopt MULTIOS              # Allow multiple descriptors, eg. `cmd >x >y`

# Set the current title of the terminal to the running command
zstyle ':prezto:module:terminal' auto-title 'yes'
zplug "modules/terminal", from:prezto

# Helpful git aliases
# https://github.com/sorin-ionescu/prezto/tree/master/modules/git
zplug "modules/git", from:prezto

# General key bindings
# https://github.com/sorin-ionescu/prezto/blob/master/modules/editor/init.zsh
zstyle ':prezto:module:editor' key-bindings 'emacs'
zplug "modules/completion", from:prezto

# ghq - Remote repository management made easy
# https://github.com/motemen/ghq
zplug "motemen/ghq", \
    from:gh-r, \
    as:command, \
    rename-to:ghq, \
    use:"*${machine}*amd64*"

# fzf - General-purpose command-line fuzzy finder
# https://github.com/junegunn/fzf
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*${machine}*amd64*"

zplug "junegunn/fzf", use:"shell/completion.zsh", defer:2
zplug "junegunn/fzf", use:"shell/key-bindings.zsh", defer:2

# By default fzf starts in fullscreen
# This reverse it and tells it to use at most 40% of my window
export FZF_DEFAULT_OPTS='--height 40% --reverse'

# enhancd - A next-generation cd command with an interactive filter (uses fzf)
# https://github.com/b4b4r07/enhancd
zplug "b4b4r07/enhancd", use:init.sh, defer:2

# Syntax highlight command prompt
# https://github.com/sorin-ionescu/prezto/tree/master/modules/syntax-highlighting
zplug "modules/syntax-highlighting", from:prezto, defer:2

# Enable additional highlighters
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'root'

# Type in any part of a previously entered command and Zsh suggests
# commands as you type based on history and completions.
# https://github.com/zsh-users/zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions", defer:2

# Chooses the most recent match whose preceding history item matches the most recently executed command
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/src/strategies/match_prev_cmd.zsh#L2
export ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Theme ------------------------------------------------------------------------
zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

# Aliases
# ==============================================================================

# Change to a git repo (managed through ghq)
alias cg='cd --ghq'

# Change to home
alias ch='cd ~'

# Cargo
# ==============================================================================

export PATH="$HOME/.cargo/bin:$PATH"
