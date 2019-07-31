#!/usr/bin/bash -x

# Install Salt
# https://docs.saltstack.com/en/latest/topics/installation/arch.html
/usr/bin/pacman -S --noconfirm salt

/usr/bin/mkdir -p /etc/salt

cat /tmp/etc/salt/minion > /etc/salt/minion

/usr/bin/mkdir -p /srv/{salt,pillar,grains}

/usr/bin/systemctl enable salt-master.service
