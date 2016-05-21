#
# ~/.zshrc
# Author: Wead Hsu <wead_hsu@github.io>
#
# General Settings
# ------------------------------------------------


setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt multios
setopt cdablevarS
setopt autocd
setopt extendedglob
setopt interactivecomments
setopt nobeep
setopt nocheckjobs
setopt correct

###############################################################################
# History
###############################################################################

HISTSIZE=1000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zshinfo
setopt histignoredups
setopt share_history
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

##############################################################################
# Alias
##############################################################################

alias ll='ls -lahG'
alias du='du -sh'
alias ls='ls -hG'
alias du='du -sh'
alias df='df -h'
alias gs='git status'
alias ga='git add'
