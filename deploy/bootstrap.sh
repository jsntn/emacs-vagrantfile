#!/bin/bash

sudo pacman -Syu --noconfirm

# install git
sudo pacman -S --noconfirm git

# install base-devel
sudo pacman -S --noconfirm base-devel
# https://wiki.archlinux.org/title/Arch_User_Repository

# install emacs28
# pacman -S --noconfirm emacs
git clone https://aur.archlinux.org/emacs28.git
cd emacs28
makepkg -si --noconfirm --skippgpcheck


# clone my .emacs.d
# cd ~
# git clone https://github.com/jsntn/emacs.d .emacs.d || true

# install pyright
