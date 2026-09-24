#!/bin/sh
set -e

mkdir -p /root/.ssh
chmod 700 /root/.ssh

cp /keys/flint2_ed25519 /root/.ssh/flint2_ed25519
chmod 600 /root/.ssh/flint2_ed25519

cp /keys/known_hosts /root/.ssh/known_hosts
chmod 644 /root/.ssh/known_hosts

mkdir -p /root/.config/ansible
chmod 700 /root/.config/ansible

cp /secrets/vault-password /root/.config/ansible/vault-password
chmod 600 /root/.config/ansible/vault-password

exec "$@"
