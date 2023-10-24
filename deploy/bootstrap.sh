#!/bin/bash

set -e

if command -v snap &> /dev/null; then
    echo "Snap is installed."
else

    sudo pacman -Syu --noconfirm

    # install git
    sudo pacman -S --noconfirm git

    # install base-devel
    sudo pacman -S --noconfirm base-devel
    # https://wiki.archlinux.org/title/Arch_User_Repository

    # install snap
    cd ~
    git clone https://aur.archlinux.org/snapd.git || true
    cd snapd
    makepkg -si --noconfirm --skippgpcheck

    sudo systemctl enable --now snapd.socket

    sudo ln -s /var/lib/snapd/snap /snap

    # =======
    # NOTE: RESTART SYSTEM TO ENSURE SNAP'S PATHS ARE UPDATED CORRECTLY
    sudo shutdown now
    # =======

fi


# install emacs28
# pacman -S --noconfirm emacs
sudo snap install emacs --channel=28.x/stable --classic
# via https://snapcraft.io/emacs

# clone my .emacs.d
# cd ~
# git clone https://github.com/jsntn/emacs.d .emacs.d || true

# pacman -Syu --noconfirm

# install python and pip
# sudo pacman -S --noconfirm python

# install pipx
# sudo pacman -S --noconfirm python-pipx
# pipx ensurepath

# install pyright
# pipx install pyright

# install virtualenv
# pipx install virtualenv

# install zsh
# sudo pacman -S --noconfirm zsh

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
