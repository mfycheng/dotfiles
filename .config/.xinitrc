#!/bin/bash
VBoxClient-all &

feh --bg-scale --randomize ~/backgrounds/

eval $(ssh-agent)
exec i3
