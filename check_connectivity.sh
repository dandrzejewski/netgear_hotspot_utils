#!/bin/bash

PING_HOST="google.com"
PING_COUNT=10
REBOOT_SCRIPT_NAME="hsreboot.py"


SCRIPT="$(readlink -f ${BASH_SOURCE[0]})"
SCRIPT_DIR="$(dirname ${SCRIPT})"

REBOOT_CMD="${SCRIPT_DIR}/${REBOOT_SCRIPT_NAME}"

/bin/ping -c 10 ${PING_HOST}

if [ $? -ne 0 ]; then
    echo "Unable to ping ${PING_HOST}, rebooting hotspot."
    ${REBOOT_CMD}
else
    echo "Host ${PING_HOST} is reachable, no reboot needed."
fi
