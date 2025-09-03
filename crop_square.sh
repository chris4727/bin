#!/usr/bin/bash
# ==  YTDL Cover  ===============================
# Author: chris4727
# Downloads video thumbnail and crops to 1:1
# Dependencies:
# - yt-dlp
# - ImageMagick

vars() {
  input_photo="$1"
  output_dir="$2"
  red="\033[0;31m"
  blu="\033[0;34m"
  grn="\033[0;32m"
  prp="\033[0;35m"
  nc="\033[0m" # No Color
}

check_dep() {
  if ! command -v "magick" &> /dev/null
  then
    printf "${red}Error:${nc} ImageMagick is not installed.\n"
    exit 1
  fi
}

echo_vars() {
  printf "$input_photo\n"
  printf "$output_dir\n"
}

check_args() {
  if [ $# -ne 1 ]; then
    printf "${red}Error:${nc} This script expects one argument <photo.jpg>\n"
    printf "${grn}Usage:${nc} crop_square <photo.jpg>\n"
    exit 1
  fi
}

crop() {
  # Crop to 1:1
  printf "${blu}:: ${nc}Cropping to 1:1\n"
  magick "$input_photo" -gravity center -crop 1:1 crop-"$input_photo"
}

main() {
  vars "$@"
  check_dep
  #echo_vars
  check_args "$@"
  crop
  printf "${grn}==> ${nc}Completed.\n"
}

main "$@"


