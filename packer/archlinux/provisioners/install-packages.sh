#!/usr/bin/env bash

# Assert ownership of home directory and all subtrees:
sudo chown -R vagrant ${HOME}

sudo pacman -Syu --noconfirm git

# Install yay: https://aur.archlinux.org/yay.git
mkdir -p ${HOME}/src/vcs/aur.archlinux.org
cd ${HOME}/src/vcs/aur.archlinux.org
git clone https://aur.archlinux.org/yay.git
cd ${HOME}/src/vcs/aur.archlinux.org/yay
makepkg --install --syncdeps --noconfirm
cd ${HOME}

# Update everything:
yay

# Install reflector and optimize mirror list:
yay -Sy --noconfirm --gitclone reflector
sudo reflector --verbose \
          --latest 10 \
          --sort rate \
          --protocol https \
          --country 'United States' \
          --save /etc/pacman.d/mirrorlist

# Install desired system packages
yay -Sy --noconfirm --gitclone git \
                               base-devel \
                               vim \
                               neovim \
                               keybase \
                               fish \
                               neovim \
                               qrencode \
                               libpam-google-authenticator \
                               yubico-pam \
                               yubikey-manager \
                               yubikey-personalization