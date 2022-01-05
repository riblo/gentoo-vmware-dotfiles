
KVER="5.15.11"
LVER="$(cat localversion)"

# Change kernel
# eselect kernel set <N>

# Mount /boot
mount /boot

# Copy .config
cp -v .config /usr/src/linux/.config

# Copy localversion
cp -v localversion /usr/src/linux/localversion

# Last checks 
LLVM=1 LLVM_IAS=1 make -j$(nproc) menuconfig

# Build Linux with I/O niceness
LLVM=1 LLVM_IAS=1 ionice -c2 -n0 make -j$(nproc)

# Install the kernel modules
LLVM=1 LLVM_IAS=1 make -j$(nproc) modules_install

# Install the bzImage, known as vmlinuz
LLVM=1 LLVM_IAS=1 make -j$(nproc) install

# Create initramfs
dracut --kver $KVER-$LVER-x86_64 /boot/initramfs-$KVER-$LVER-x86_64.img --force

# Update grub2
grub-mkconfig -o /boot/grub/grub.cfg

# Enable cfs zen tweaks
rc-update add set-cfs-tweaks boot
rc-service set-cfs-tweaks start

# Update & patch linux-logo
rc-service linux-logo restart
sed -i 's/|/ /g; /+-/d' $(ls -1 /etc/issue /etc/issue.net)