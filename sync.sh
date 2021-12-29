#!/bin/bash

# home
cp -vrf ~/.bash_logout home/bash_logout
cp -vrf ~/.bash_profile home/bash_profile
cp -vrf ~/.bashrc home/bashrc
cp -vrf ~/.blerc home/blerc
cp -vrf ~/.config/cava/config home/config/cava/config
cp -vrf ~/.config/htop/htoprc home/config/htop/htoprc
cp -vrf ~/.config/starship.toml home/config/starship.toml
cp -vrf ~/.config/terminator/config home/config/terminator/config
#cp -vrf ~/.gitconfig home/gitconfig
cp -vrf ~/.inputrc home/inputrc

# etc
cp -vrf /etc/dracut.conf etc/dracut.conf
cp -vrf /etc/portage/make.conf etc/portage/make.conf
cp -vrf /etc/portage/package.* etc/portage/
cp -vrf /etc/portage/env etc/portage/
