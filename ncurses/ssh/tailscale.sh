#/bin/bash

# This script validates if you're connected to your local SSID
# or a different one
#
# Edit your `~/.ssh/config` as
# Host machine-01
#   User facundo
#   ProxyCommand bash -c "nc `~/.ssh/tailscale.sh <YOUR-HOME-SSID> <MACHINE-LOCAL-IP> <MACHINE-TAILSCALE-ALIAS> ` %p"

LOCAL_SSID="${1}"
LOCAL_IP="${2}"
TAILS_NAME="${3}"
SSID=`networksetup -getairportnetwork en0 | sed 's/.*: //'`

if [ "${LOCAL_SSID}" == "${SSID}" ]
then
  echo "${LOCAL_IP}"
else
  /Applications/Tailscale.app/Contents/MacOS/Tailscale ip -4 "${TAILS_NAME}"
fi
