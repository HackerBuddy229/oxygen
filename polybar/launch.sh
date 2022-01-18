#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar --config=$HOME/.config/polybar/colorfulconfig DP >>/tmp/polybar1.log 2>&1 & disown
polybar --config=$HOME/.config/polybar/colorfulconfig HDMI >>/tmp/polybar2.log 2>&1 & disown
polybar --config=$HOME/.config/polybar/colorfulconfig HDMILEFT >>/tmp/polybar3.log 2>&1 & disown
polybar --config=$HOME/.config/polybar/colorfulconfig HDMIRIGHT >>/tmp/polybar4.log 2>&1 & disown

echo "Bars launched..."
