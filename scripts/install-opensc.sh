#!/usr/bin/bash -x

# Install and configure OpenSC for VM SmartCard support
# https://wiki.archlinux.org/index.php/Smartcards#Installation
/usr/bin/pacman -S --noconfirm ccid \
                               opensc \
                               pcsc-tools

cat /tmp/etc/opensc.conf > /etc/opensc.conf
echo -e 'enable_pinpad = false' >> /etc/opensc.conf
echo -e 'card_drivers = cac' >> /etc/opensc.conf
echo -e 'force_card_driver = cac' >> /etc/opensc.conf

/usr/bin/systemctl enable pcscd.service
/usr/bin/systemctl enable pcscd.socket
