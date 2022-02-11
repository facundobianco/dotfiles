#!/bin/bash

BROWSER="/opt/google/chrome/google-chrome"
URL="http://www.google.co.uk/search?q="
PRE_FORMAT_QUERY=$1
QUERY=$(echo $PRE_FORMAT_QUERY | sed -e "s/\ /+/g")

${BROWSER} ${URL}${QUERY}
