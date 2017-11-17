#
# Executes commands at the start of an interactive session.
#$
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
