
# ripgrep -> grep
# https://github.com/BurntSushi/ripgrep
alias grep='ripgrep'

# exa -> ls
# https://github.com/ogham/exa
alias ls='exa -F --git --group-directories-first'

# ls
alias l='ls -1a'   # Lists in one column, hidden files.
alias ll='ls -lh'  # Lists human readable sizes.
alias lr='ll -R'   # Lists human readable sizes, recursively.
alias la='ll -a'   # Lists human readable sizes, hidden files.

# bat -> cat
# https://github.com/sharkdp/bat
alias cat='bat'

# prettyping -> ping
# https://github.com/denilsonsa/prettyping
alias ping='prettyping --nolegend'

# ncdu -> du
# https://github.com/rofl0r/ncdu
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# glances -> top
# https://nicolargo.github.io/glances/
alias top='glances'
