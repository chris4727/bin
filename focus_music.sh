#!/usr/bin/sh
# ==  focus_music.sh  ======================================
# Description:
# - Play focus music in the background
# Author: chris4727
# Dependancies:
# - mpv
# TODO
# - Stop playing command
# - Accept optional url as argument
# - Select from several predefined streams
# - Select from local playlist
# - Play spinner while playing music. ascii cd or tape?

vars() {
  url="$1"
  stream_url="https://www.youtube.com/watch?v=UI5NKkW8acM&pp=ygUIc3RlZXp5YWY%3D" # Steezyaf Coffee Shop Radio
  red="\033[0;31m"
  yel="\033[0;33m"
  grn="\033[0;32m"
  blu="\033[0;34m"
  prp="\033[0;35m"
  nc="\033[0m"
}

check_dependencies() {
  if ! command -v "mpv" &> /dev/null
  then
    printf "${red}Error:${nc} mpv is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -ne 0 ]; then
    printf "${red}Error:${nc} This script expects no arguments\n"
    printf "${grn}Usage:${nc} focus_music.sh\n"
    exit 1
  fi
}

play_music() {
  mpv --no-video --really-quiet "$stream_url"
}

main() {
  vars "$@"
  check_dependencies
  #echo_vars
  check_args "$@"
  play_music
}

main "$@"

