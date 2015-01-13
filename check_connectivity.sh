#!/bin/bash

PING_HOST="google.com"
PING_COUNT=10
REBOOT_CMD="/root/restart_hotspot.py"


/bin/ping -c 10 ${PING_HOST}

if [ $? -ne 0 ]; then
    echo "Unable to ping ${PING_HOST}, rebooting hotspot."
    ${REBOOT_CMD}
else
    echo "Host ${PING_HOST} is reachable, no reboot needed."
fi
