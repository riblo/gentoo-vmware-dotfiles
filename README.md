# dotfiles-gentoo

## My "eye-candy" bash dotfiles supports:
- custom syntax highlighting and enhanced completion (like *fish*) with [ble.sh](https://github.com/akinomyoga/ble.sh)
- [starship](https://starship.rs/) custom prompt
- useful [shopt](https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html) behaviors and aliases
- shared/cleaned *history* between terminals (see **Credits**)
- *cd* improved with [autojump](https://github.com/wting/autojump)
- better colorized output with  [grc](https://github.com/garabik/grc)
- *gitconfig* with [delta](https://github.com/dandavison/delta) highlight enabled
- [htop](https://htop.dev/) conf
- [cava](https://github.com/karlstav/cava) conf
- [terminator](https://terminator-gtk3.readthedocs.io/) conf

## My Gentoo stuffs:
- [make.conf](https://wiki.gentoo.org/wiki//etc/portage/make.conf) for gentoo vm running on *vmware workstation*
- [package.env](https://wiki.gentoo.org/wiki//etc/portage/package.env) for [overriding environment per package](https://wiki.gentoo.org/wiki/Knowledge_Base:Overriding_environment_variables_per_package)
- [custom cflags](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html) per package build optimization (see **Credits**)
- [package files](https://wiki.gentoo.org/wiki/Handbook:Parts/Portage/Files#User-specific_configuration)
- [WIP] debloated/vm-oriented kernel [.config](https://www.kernel.org/doc/html/latest/kbuild/makefiles.html?highlight=config%20file#overview) files for [gentoo-sources](https://packages.gentoo.org/packages/sys-kernel/gentoo-sources) and [zen-sources](https://github.com/zen-kernel/zen-kernel) 
- [ccache](https://ccache.dev/) conf

## Installation
Clone, review the needed code and **use at your own risk!**

## TODO
- add new *bash* shortcuts
- improve *history* management/approach
- [WIP] add [fzf](https://github.com/junegunn/fzf) support
- [WIP] improve kernel configurations 
- try to improve audio latency, playing with *jack*(https://github.com/jackaudio) or *pipewire*(https://pipewire.org/)
- try to resurrect [fbsplash](https://wiki.gentoo.org/wiki/Fbsplash) [just for fun]

## References

#### history improvements && .bashrc stuffs
- https://unix.stackexchange.com/questions/48713/how-can-i-remove-duplicates-in-my-bash-history-preserving-order
- https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history
- https://portonsoft.wordpress.com/2012/12/02/running-x-sessions/
- https://codeinthehole.com/tips/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
- https://gist.github.com/tuxfight3r/60051ac67c5f0445efee
- http://mywiki.wooledge.org/BashGuide/Practices
- https://www.baeldung.com/linux/bash-variables-export
#### cflags
- https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
- https://github.com/orsonteodoro/gentoo-cflags
- https://github.com/UoC-Radio/gentoo-stuff
#### vmware && kernel
- https://wiki.gentoo.org/wiki/VMware
- https://wiki.archlinux.org/index.php/VMware/Install_Arch_Linux_as_a_guest
- https://wiki.gentoo.org/wiki/Kernel/Upgrade
- https://forums.gentoo.org/viewtopic-t-961502.html
