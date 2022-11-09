#!/bin/bash
set -o errexit

CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
CURRENT_FILE=$(basename "${BASH_SOURCE[0]}")

OPTS=$(getopt --name $CURRENT_FILE --options v: --longoptions vps: --options d: --longoptions dns: -- "$@")
eval set -- "$OPTS"
unset OPTS

while true; do
  case $1 in
    -v|--vps)
      VPS=$2
      shift 2
      ;;
    -d|--dns)
      DNS=$2
      shift 2
      ;;
    --)
      shift
      break
      ;;
  esac
done

ansible-playbook $CURRENT_DIR/playbook.yaml --extra-vars VPS=${VPS:-aws} --extra-vars DNS=${DNS:-cloudflare}
echo 'Setup finished.'
