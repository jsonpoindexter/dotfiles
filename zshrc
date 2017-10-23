
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

# Determine current os
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     os=linux;;
    Darwin*)    os=macos;;
    *)          os="UNKNOWN:${unameOut}"
esac

# Turn on colors for all prezto modules
zstyle ':prezto:*:*' color 'yes'

# https://github.com/sorin-ionescu/prezto/tree/master/modules/editor
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor' ps-context 'yes'
zstyle ':prezto:module:editor:info:completing' format '...'

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

# exa - Replacement for 'ls' written in Rust
# https://github.com/ogham/exa
zplug "ogham/exa", \
    from:gh-r, \
    as:command, \
    rename-to:exa, \
    use:"*${os}*x86_64*"

# fzf - General-purpose command-line fuzzy finder
# https://github.com/junegunn/fzf
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*${machine}*amd64*"

# ripgrep - Replacement for 'grep' written in Rust
# https://github.com/BurntSushi/ripgrep
zplug "BurntSushi/ripgrep", \
    from:gh-r, \
    as:command, \
    rename-to:rg, \
    use:"*x86_64*${machine}*"

# By default fzf starts in fullscreen
# This reverse it and tells it to use at most 40% of my window
export FZF_DEFAULT_OPTS='--height 40% --reverse'

# enhancd - A next-generation cd command with an interactive filter (uses fzf)
# https://github.com/b4b4r07/enhancd
zplug "b4b4r07/enhancd", use:init.sh, defer:3

export ENHANCD_DOT_ARG='...'

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

# History Search (up/down arrows)
# https://github.com/sorin-ionescu/prezto/blob/master/modules/history-substring-search/init.zsh
zplug "modules/history-substring-search", from:prezto, defer:3

# Theme ------------------------------------------------------------------------
zplug "dracula/zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

# Configure history search

# Ensures history results are unique when searching
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Colorize found/not-found
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='none'

# fzf
source ~/.zplug/repos/junegunn/fzf/shell/completion.zsh
source ~/.zplug/repos/junegunn/fzf/shell/key-bindings.zsh

# Aliases
# ==============================================================================

# Change to a git repo (managed through ghq)
alias cg='cd -G'

# Change to home
alias ch='cd ~'

# exa -> ls
alias ls='exa --group-directories-first'
alias l='ls -1'
alias ll='ls -l'
alias la='ls -la'

# Android
# ==============================================================================
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk-bundle"

# Cargo
# ==============================================================================
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

# Go
# ==============================================================================
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH" 

# Google Cloud SDK
# ==============================================================================
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# iTerm
# ==============================================================================
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
