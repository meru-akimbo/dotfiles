#!/usr/local/bin/zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
PATH=/usr/local/bin:$PATH

PROMPT="[%/%%] "

# anyenv
if [ -d ${HOME}/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in `ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done

fi
export PLENV_VERSION=5.18.0

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export LANG=ja_JP.UTF-8

export GOPATH=$HOME/.go

export EDITOR=vim

bindkey -d  # いったんキーバインドをリセット
bindkey -e  # emacsモードで使う
