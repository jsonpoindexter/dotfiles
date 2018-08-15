
# Hide $GOPATH away as its significantly less important now with Go1.11
export GOPATH="$HOME/.go"

# Add `go get` installed tools to $PATH
export PATH="$GOPATH/bin:$PATH"
