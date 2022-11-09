#!/bin/bash
set -o errexit

CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ansible-playbook $CURRENT_DIR/playbook.yaml $ANSIBLE_OPTIONS
echo 'Setup finished.'
