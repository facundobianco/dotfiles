#!/bin/bash

#: Requires pmenu
#: https://github.com/sgtpep/pmenu

APPS="
  k9s
  cmus
  htop
  nvlc
  mpsyt
"

CMND=`echo "${APPS}" | sed 's/ /\n/g' | sort | pmenu`

[[ -n "${CMND}" ]] && "${CMND}"
