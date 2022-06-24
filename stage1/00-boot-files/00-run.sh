#!/bin/bash -e

install -m 644 files/cmdline.txt "${ROOTFS_DIR}/boot/"
install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"

# Add userconf file for first boot
on_chroot << EOF
if [ -n "${FIRST_USER_PASS}" ]; then
    echo "$FIRST_USER_NAME":$(openssl passwd -6 "$FIRST_PASSWORD") >> "${ROOTFS_DIR}/boot/userconf.txt"
fi
EOF
