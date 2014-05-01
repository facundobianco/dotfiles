# apps
xbacklight -set 100 &
xsetroot -solid black &
unclutter -idle 1 &
urxvt -e sh -c "tmux new -s 0 -A" &

# wm
exec cwm
