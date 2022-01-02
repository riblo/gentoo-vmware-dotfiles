#!/bin/bash

# home
cp -vf ~/.bash_logout home/bash_logout
cp -vf ~/.bash_profile home/bash_profile
cp -vf ~/.bashrc home/bashrc
cp -vf ~/.blerc home/blerc
cp -vf ~/.vimrc home/vimrc
cp -vf ~/.config/cava/config home/config/cava/config
cp -vf ~/.config/htop/htoprc home/config/htop/htoprc
cp -vf ~/.config/starship.toml home/config/starship.toml
cp -vf ~/.config/terminator/config home/config/terminator/config
cp -vf ~/.inputrc home/inputrc
#cp -vf ~/.gitconfig home/gitconfig

# etc
cp -vf /etc/dracut.conf etc/dracut.conf
cp -vf /etc/portage/make.conf etc/portage/make.conf
cp -vf /etc/portage/package.* etc/portage/
cp -vrf /etc/portage/env etc/portage/
