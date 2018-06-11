#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias supac="sudo pacman"
alias pacup="sudo pacman -Syu"
alias please="sudo"
alias paci="sudo pacman -S"
alias pacu="yes | sudo pacman -Syu && yes | sudo pacman -Sc "
PS1='[\u@\h \W]\$ '
