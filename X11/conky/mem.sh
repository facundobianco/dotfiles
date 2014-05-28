#!/bin/sh
# Based on http://www.kernel-panic.it/openbsd/nagios/nagios6.html

MEM=$(( `sysctl -n hw.physmem` / 1048576 - `vmstat | awk 'END{print $5}'` / 1024 ))

[[ "$MEM" -lt 1000 ]] && MEM=" $MEM"
[[ "$MEM" -lt  100 ]] && MEM=" $MEM"

echo "$MEM"
