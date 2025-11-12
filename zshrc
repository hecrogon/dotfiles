# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fasd web-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/opt/ruby1.9/bin:$PATH
#export PATH=$PATH:/home/hector/develop/sprinklr-crawler/WhatWeb

#export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
#export PATH=$PATH:/usr/share/java/apache-ant/bin:/opt/android-sdk/platform-tools
#export PATH=$PATH:/usr/bin/vendor_perl:/usr/bin/core_perl

export PATH=$PATH:~/bin

alias vi='nvim'
alias vim='nvim'
alias ls='eza'
alias cat='bat'

# Bindings
bindkey "^P" up-line-or-search

DEFAULT_USER=hector

# Wine
# export WINEDEBUG=-all

# Git
export GIT_EDITOR=nvim

# Powerline
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

alias tmux='TERM=xterm-256color tmux'

# TMUXP
export DISABLE_AUTO_TITLE='true'

# VENV
# usage
# $ mkvenv myvirtualenv # creates venv under ~/.venv/
# $ venv myvirtualenv   # activates venv
# $ deactivate          # deactivates venv
# $ rmvenv myvirtualenv # removes venv

export VENV_HOME="$HOME/.venv"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}

# LUA
export LUA_PATH="$HOME/.luarocks/share/lua/5.4/?.lua;$HOME/.luarocks/share/lua/5.4/?/init.lua;$LUA_PATH"
export LUA_CPATH="$HOME/.luarocks/lib/lua/5.4/?.so;$LUA_CPATH"

# AWS
alias assume="source assume"
