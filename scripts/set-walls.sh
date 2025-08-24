#!/bin/bash

# array of images
walls=(~/Pictures/walls/*)

hyprpaper &

for wall in "${walls[@]}"; do
	# preload all walls 
	hyprctl hyprpaper preload "$wall"

	# set wallpaper
	hyprctl hyprpaper wallpaper "eDP-1,$wall"
	sleep 300 # change wallpaper every five minuts 
done
