#!/usr/bin/sh
# ==  audio_spectrum.sh  ======================================
# Description:
# - Shows the audio spectrum of input audio file
# Author: chris4727
# Dependancies:
# - ffmpeg


vars() {
  argument="$1"
  red="\033[0;31m"
  yel="\033[0;33m"
  grn="\033[0;32m"
  blu="\033[0;34m"
  prp="\033[0;35m"
  nc="\033[0m"
}

check_dependencies() {
  if ! command -v "ffmpeg" &> /dev/null
  then
    printf "${red}Error:${nc} ffmpeg is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -ne 1 ]; then
    printf "${red}Error:${nc} This script expects one argument\n"
    printf "${grn}Usage:${nc} audio_spectrum.sh ${prp}<audio_file>${nc}\n"
    exit 1
  fi
}

show_spectrum() {
  printf "${prp}Hello world!${nc}\n"
  ffmpeg -i "$1" -lavfi showspectrumpic=s=800x1000:color=rainbow -frames:v 1 "$1".png
  sxiv "$1".png
}

main() {
  vars "$@"
  check_dependencies
  #echo_vars
  check_args "$@"
  show_spectrum "$@"
}

main "$@"

