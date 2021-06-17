#!/bin/sh
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
ln -sfvn ${HOME}/dotfiles/xmobar ${XDG_CONFIG_HOME}/xmobar

XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}
mkdir ${XDG_DATA_HOME}/xmobar

cd $(dirname ${0})
git config filter.xmobar-override-position.clean 'xmobar/override/position.sh'
