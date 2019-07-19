#!/usr/bin/env bash

target_shell=/usr/bin/fish
target_user=vagrant

echo "Setting default shell to ${target_shell} for user ${target_user}"
usermod -s ${target_shell} ${target_user} || echo "Shell ${target_shell} is unavailable for user ${target_user}"
