#!/usr/bin/sh

# Requires two arguments <input.jpg> <output.jpg>
# Sets picture to 1080px on longest edge, strips metadata, and sets jpg
# compression to 85 for web
magick "$1" -resize 1080x1080\> -strip -quality 85 "$2"
