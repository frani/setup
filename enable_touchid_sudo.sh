#!/bin/sh

# Enable Touch ID for sudo

if ! sudo -v; then
    echo "🚫 User does not have sudo permissions"
    exit 1
fi

if grep -q pam_tid.so /etc/pam.d/sudo; then
    echo "👌 Touch ID sudo already set up"
else
    sudo sed -i '' '2i\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo
    echo "👍 Touch ID sudo added"
fi
