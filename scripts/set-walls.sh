#!/bin/bash

# array of images
walls=(~/Pictures/walls/*)

hyprpaper &

# preload all wallpapers once 
for wall in "${walls[@]}"; do
    hyprctl hyprpaper preload "$wall"
done

for wall in "${walls[@]}"; do
	# set wallpaper
	hyprctl hyprpaper wallpaper "eDP-1,$wall"
	sleep 10 # change wallpaper every five minuts 
done
