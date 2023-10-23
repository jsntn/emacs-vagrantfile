#!/bin/bash

sudo pacman -Syu --noconfirm

# install emacs28
pacman -S --noconfirm emacs

# install git
pacman -S --noconfirm git

# clone my .emacs.d
# cd ~
# git clone https://github.com/jsntn/emacs.d .emacs.d || true

# install pyright