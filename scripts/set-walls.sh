#!/bin/bash

# array of images
walls=(~/Pictures/walls/*)

hyprpaper &

# preload all wallpapers once 
for wall in "${walls[@]}"; do
	hyprctl hyprpaper preload "$wall"
done

# cycle forever, picking random ones
while true; do
	wall="${walls[RANDOM % ${#walls[@]}]}"
	hyprctl hyprpaper wallpaper "eDP-1,$wall"

	sleep 300   # 5 minutes
done
