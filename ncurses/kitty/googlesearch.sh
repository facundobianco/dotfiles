#!/bin/bash

BROWSER="xdg-open"
URL="https://www.google.com/search?q="
PRE_FORMAT_QUERY=$1
QUERY=$(echo $PRE_FORMAT_QUERY | sed -e "s/\ /+/g")

${BROWSER} ${URL}${QUERY}
