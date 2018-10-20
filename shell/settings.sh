
#
# Go
#

# Hide $GOPATH away as its significantly less important now with Go1.11
export GOPATH="$HOME/.go"

# Add `go get` installed tools to $PATH
export PATH="$GOPATH/bin:$PATH"

#
# Rust
#

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

#
# Google Cloud SDK
#

# From Homebrew
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
