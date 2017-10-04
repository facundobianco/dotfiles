#!/bin/bash

if  xlsclients | grep -q 'urxvt -name main'
then
    i3-sensible-terminal
else
    urxvt -name main -geometry 170x47+0-0 -e sh -c "tmux a" &
fi
