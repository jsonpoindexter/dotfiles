#
# Executes commands at the start of an interactive session.
#

#
# Prezto
#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt BANG_HIST # Do not perform textual expansion of `!`
unsetopt SHARE_HISTORY # Do not share history between running sessions

#
# enhancd
# https://github.com/b4b4r07/enhancd
#

source $DOTFILES/enhancd/init.sh

alias cg='cd --ghq'

#
# ripgrep
# https://github.com/BurntSushi/ripgrep
#

alias grep='rg'

#
# exa
# https://github.com/ogham/exa
#

alias ls='exa --group-directories-first'
alias l='ls -1'
alias ll='ls -l'
alias la='ls -la'

#
# iTerm
#

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#
# Android
#

export NDK_HOME=$HOME/Library/Android/sdk/ndk-bundle

#
# Cargo / Rust
#

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

#
# Go
#

export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

#
# Fastlane
#

export PATH="$HOME/.fastlane/bin:$PATH"

#
# Google Cloud SDK
#

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

#
# .bin in $HOME
#

export PATH="$HOME/.bin:$PATH"
