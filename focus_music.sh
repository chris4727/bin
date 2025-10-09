#!/usr/bin/sh
# ==  focus_music.sh  ======================================
# Description:
# - Play focus music in the background
# Author: chris4727
# Dependancies:
# - mpv
# TODO
# - [x] Stop playing command
# - [ ] Accept optional url as argument
# - [x] Select from several predefined streams
# - [ ] Select from local playlist
# - [ ] Play spinner while playing music. ascii cd or tape?

vars() {
  url="$1"
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

select_music() {
  printf "${blu} ::${nc} What do you want to listen to? (${prp}1 or 2${nc})\n"
  printf "${grn}   1.${nc} ${prp}Nujabes${nc} Instrumental mix\n"
  printf "${grn}   2.${nc} ${prp}Steezyaf${nc} Coffee Shop Radio\n"
  
  read -p "Enter selection (1-2): " choice
  
  case $choice in 
    1)
      stream_url="https://www.youtube.com/watch?v=z3aS5AwhJSU&list=RDz3aS5AwhJSU&start_radio=1" # Nujabes playlist
      ;;
    2)
      stream_url="https://www.youtube.com/watch?v=UI5NKkW8acM&pp=ygUIc3RlZXp5YWY%3D" # Steezyaf Coffee Shop Radio
      ;;
    *)
      printf "${yel}Invalid choice:${nc} Enter a number bewtween 1 and 2\n"
      ;;
  esac 
}

play_music() {
  printf "${blu} ::${nc} ${grn}Playing...${nc}\n"
  printf "${blu} ::${nc} Press ${prp}Ctrl+c${nc} to stop\n"
  mpv --no-video --really-quiet "$stream_url"
}

main() {
  vars "$@"
  check_dependencies
  #echo_vars
  check_args "$@"
  select_music
  play_music
}

main "$@"

