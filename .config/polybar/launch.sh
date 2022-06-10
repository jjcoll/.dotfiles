#!/bin/bash

killall -q polybar
polybar eliotBar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
feh --bg-scale ~/wallpapers/w.jpg
