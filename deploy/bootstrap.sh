#!/bin/bash

sudo pacman -Syu --noconfirm

# install git
sudo pacman -S --noconfirm git

# install base-devel
sudo pacman -S --noconfirm base-devel
# https://wiki.archlinux.org/title/Arch_User_Repository



# install snap
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si --noconfirm --skippgpcheck

sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
# either log out and back in again, or restart your system, to ensure snap's paths are updated correctly.

# install emacs28
# pacman -S --noconfirm emacs

# https://snapcraft.io/emacs


# clone my .emacs.d
# cd ~
# git clone https://github.com/jsntn/emacs.d .emacs.d || true

# install pyright
