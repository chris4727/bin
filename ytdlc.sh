#!/usr/bin/bash
# ==  YTDL Cover  ===============================
# Author: chris4727
# Downloads video thumbnail and crops to 1:1
# Dependencies:
# - yt-dlp
# - ImageMagick

vars() {
  input_url="$1"
  output_dir="$2"
  red="\033[0;31m"
  blu="\033[0;34m"
  grn="\033[0;32m"
  prp="\033[0;35m"
  nc="\033[0m" # No Color
}

check_dep() {
  if ! command -v "yt-dlp" &> /dev/null
  then
    printf "${red}Error:${nc} yt-dlp is not installed.\n"
    exit 1
  fi
  if ! command -v "magick" &> /dev/null
  then
    printf "${red}Error:${nc} ImageMagick is not installed.\n"
    exit 1
  fi
}

echo_vars() {
  printf "$input_url\n"
  printf "$output_dir\n"
}

check_args() {
  if [ $# -ne 2 ]; then
    printf "${red}Error:${nc} This script expects two arguments <input-url> <output-dir>\n"
    printf "${grn}Usage:${nc} ytdla <url.com> <output-dir>\n"
    exit 1
  fi
}

get_thumbnail() {
  # Download video thumbnail
  # TODO name output file cover.jpg or the same as audio file
  printf "${blu}:: ${nc}Downloading ${prp}$input_url${nc} thumbnail into $output_dir\n"
  yt-dlp --skip-download --write-thumbnail $input_url
  printf "${grn}==> ${nc}Download completed.\n"
}

to_jpg() {
  # Convert webp to jpg
  printf "${blu}:: ${nc}Converting thumbnail to jpg\n"
  magick *.webp cover.jpg
}

crop() {
  # Crop to 1:1
  printf "${blu}:: ${nc}Cropping to 1:1\n"
  magick cover.jpg -gravity center -crop 1:1 cover.jpg
}

main() {
  vars "$@"
  check_dep
  #echo_vars
  check_args "$@"
  get_thumbnail
  #to_jpg
  #crop
  printf "${grn}==> ${nc}Completed.\n"
}

main "$@"


