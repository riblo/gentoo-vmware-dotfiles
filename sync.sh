#!/bin/bash

# home
cp -vf ~/.bash_logout home/bash_logout
cp -vf ~/.bash_profile home/bash_profile
cp -vf ~/.bashrc home/bashrc
cp -vf ~/.blerc home/blerc
cp -vf ~/.vimrc home/vimrc
cp -vf ~/.config/cava/config home/config/cava/
cp -vf ~/.config/htop/htoprc home/config/htop/
cp -vf ~/.config/starship.toml home/config/
cp -vf ~/.config/terminator/config home/config/terminator/
cp -vf ~/.config/latte/gentoo-3-docks_v0.2.layout.latte home/config/latte/
cp -vf ~/.inputrc home/inputrc
#cp -vf ~/.gitconfig home/gitconfig

# etc
cp -vf /etc/dracut.conf etc/
cp -vf /etc/portage/make.conf etc/portage/
cp -vf /etc/portage/package.* etc/portage/
cp -vrf /etc/portage/env etc/portage/

# scripts
cp -vfr ~/scripts/ .