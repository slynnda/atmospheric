#!/usr/bin/env bash

target_shell=/usr/bin/fish
target_user=vagrant


echo "Setting default shell to ${target_shell} for user ${target_user}"
usermod -s ${target_shell} ${target_user} || echo "Shell ${target_shell} is unavailable for user ${target_user}"

echo "Creating required directories in ${HOME} for user ${target_user}"
sudo -H --user=${target_user} bash -c 'mkdir -p {$HOME}/.local/bin \
                                            {$HOME}/.local/src \
                                            {$HOME}/.local/opt'
echo "Updating user paths for compatibility with new default shell"
sudo -H --user=${target_user} fish -c 'set -U fish_user_paths {$HOME}/.local/bin'
