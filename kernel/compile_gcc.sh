# Change kernel
eselect kernel set <N>

# Mount /boot
mount /boot

# Copy .config
cp -v .config /usr/src/linux/.config

# Copy localversion
cp -v localversion /usr/src/linux/localversion

# Last checks 
make -j$(nproc) menuconfig 

# Build Linux with I/O niceness
ionice -c2 -n0 make -j$(nproc)

# Install the kernel modules
make -j$(nproc) modules_install

# Install the bzImage, known as vmlinuz
make -j$(nproc) install

# Create initramfs
dracut --kver 5.15.11-gentoo-preempt-x86_64 /boot/initramfs-5.15.11-gentoo-preempt-x86_64.img --force


# Update grub2
grub-mkconfig -o /boot/grub/grub.cfg
