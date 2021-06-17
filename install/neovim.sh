#!/bin/sh
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
ln -sfvn ${HOME}/dotfiles/vim/.vim   ${XDG_CONFIG_HOME}/nvim
ln -sfv  ${HOME}/dotfiles/vim/.vimrc ${XDG_CONFIG_HOME}/nvim/init.vim
