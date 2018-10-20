#!/usr/bin/env sh
set -e

function update {
    (
        cd $1
        git pull origin HEAD
    )
}

update dotbot
update dotbot-brew
update enhancd
update gitalias
update pure
update zsh-autosuggestions
update zsh-syntax-highlighting
