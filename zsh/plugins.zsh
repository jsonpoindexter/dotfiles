
#
# careful_rm
# https://github.com/MikeDacre/careful_rm
#

source ~/.dotfiles/pkg/careful_rm/careful_rm.plugin.zsh

#
# enhancd
# https://github.com/b4b4r07/enhancd
#

source ~/.dotfiles/pkg/enhancd/init.sh

#
# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
#

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=25      # disables suggestion for large buffers

source ~/.dotfiles/pkg/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# fzf
# https://github.com/junegunn/fzf
#

# Setup
if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
  export PATH="$PATH:$(brew --prefix)/opt/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Use fd directly
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Define a `preview` command
alias preview="fzf --preview 'bat --color \"always\" {}' | xargs bat"

# Default options
export FZF_DEFAULT_OPTS="--ansi --prompt '❯ ' --inline-info --layout reverse --height 50%"

#
# fast-syntax-highlighting
# https://github.com/zdharma/fast-syntax-highlighting
#

source ~/.dotfiles/pkg/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#
# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
#

source ~/.dotfiles/pkg/zsh-history-substring-search/zsh-history-substring-search.zsh

#
# alias-tips
# https://github.com/djui/alias-tips
#

source ~/.dotfiles/pkg/alias-tips/alias-tips.plugin.zsh

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="alias: "

#
# calc.plugin.zsh
# > = 5 + 2
# https://github.com/arzzen/calc.plugin.zsh
#

source ~/.dotfiles/pkg/calc.plugin.zsh/calc.plugin.zsh
