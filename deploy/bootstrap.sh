#!/bin/bash

# reference,
# https://chrisgilmerproj.github.io/vagrant/apache/2013/07/05/starting-with-vagrant.html

set -e

sudo sed -i 's/^#* *\(PermitRootLogin\)\(.*\)$/\1 yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#* *\(PasswordAuthentication\)\(.*\)$/\1 yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd.service
sudo echo -e "vagrant\nvagrant" | (passwd vagrant)
sudo echo -e "root\nroot" | (passwd root)

# install emacs28
# reference,
# https://ossmalta.eu/how-to-install-gnu-emacs-28-1-in-ubuntu-22-04-20-04/
# remove the old emacs package if any, since it conflicts to the package from PPA,
sudo apt remove --autoremove emacs emacs-common || true
# then run the command below to add the PPA,
sudo add-apt-repository ppa:kelleyk/emacs
# run the command to update system package cache, which should be done automatically in Ubuntu 20.04 and higher during adding PPA,
sudo apt update
# finally, install Emacs 28 via command,
sudo apt install -y emacs28
# here you may replace above emacs28 with emacs28-nox for text-only interface and/or emacs28-nativecomp with native compilation enabled.

# clone my .emacs.d
# cd /home/vagrant
# git clone https://github.com/jsntn/emacs.d .emacs.d || true

# alias the TERM color to 256 for emacs ONLY
# reference,
# https://apiraino.github.io/emacs-themes-24bit/
# emacsclient config
# reference,
# https://www.cnblogs.com/cocode/p/12251697.html
echo "alias emacs='TERM=xterm-256color emacsclient -t -a \"\"'" > /home/vagrant/.bash_aliases

# install fzf
sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sudo ~/.fzf/install

# install tmux
sudo apt install -y tmux

# install nodejs
# https://github.com/nodesource/distributions/blob/master/README.md
# note,
# Ubuntu 18.04 LTS (Bionic Beaver) WARNING: BUILD SYSTEM CURRENTLY BROKEN FOR NODEJS 18+
# curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
# sudo apt-get install -y nodejs

# install pyright
# sudo npm install -g pyright