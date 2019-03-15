#!/usr/bin/env bash

sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm reflector
sudo reflector --verbose \
          --latest 10 \
          --sort rate \
          --protocol https \
          --country 'United States' \
          --save /etc/pacman.d/mirrorlist
sudo pacman -Syu --noconfirm git \
                        vim \
                        neovim \
                        keybase \
                        fish \
                        neovim \
                        qrencode \
                        libpam-google-authenticator \
                        autoconf \
                        automake \
                        libtool

# Add AUR to repo list:
sudo echo '[archlinuxfr]' >> /etc/pacman.conf
sudo echo 'SigLevel = Never' >> /etc/pacman.conf
sudo echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf



# Install yubico-c-client: https://github.com/yubico-c-client.git
sudo pacman -Syu --noconfirm help2man
mkdir -p /usr/local/src/vcs/github.com/Yubico && cd /usr/local/src/vcs/github.com/Yubico
git clone https://github.com/Yubico/yubico-c-client.git
cd yubico-c-client
autoreconf --install
./configure --prefix=/usr/local
make check
make install

# Install yubico-pam: https://github.com/yubico-pam.git
sudo pacman -Syu --noconfirm asciidoc docbook-xsl
cd /usr/local/src/vcs/github.com/Yubico
git clone https://github.com/Yubico/yubico-pam.git
cd yubico-pam