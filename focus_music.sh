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
}

check_dependencies() {
  if ! command -v "mpv" &> /dev/null
  then
    printf "${RD1}Error:${NC} mpv is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -ne 0 ]; then
    printf "${RD1}Error:${NC} This script expects no arguments\n"
    printf "${GR1}Usage:${NC} focus_music.sh\n"
    exit 1
  fi
}

select_music() {
  printf "${BL1} ::${NC} What do you want to listen to? (${PR1}1 or 5${NC})\n"
  printf "${GR1}   1.${NC} ${PR1}Nujabes${NC} Instrumental mix\n"
  printf "${GR1}   2.${NC} ${PR1}A Tribe Called Quest${NC} mix\n"
  printf "${GR1}   3.${NC} ${PR1}J Dilla${NC} mix\n"
  printf "${GR1}   4.${NC} ${PR1}Andersen .Paak${NC} mix\n"
  printf "${GR1}   5.${NC} ${PR1}Steezyaf${NC} Coffee Shop Radio\n"
  
  read -p "Enter selection (1-5): " choice
  
  case $choice in 
    1)
      stream_url="https://www.youtube.com/watch?v=z3aS5AwhJSU&list=RDz3aS5AwhJSU&start_radio=1" # Nujabes playlist
      ;;
    2)
      stream_url="https://www.youtube.com/watch?v=hWEan7Bv65w" # Tribe Called Quest playlist
      ;;
    3)
      stream_url="https://www.youtube.com/watch?v=QEmBwBccYjY&list=RDQEmBwBccYjY&start_radio=1" # J Dilla mix
      ;;
    4)
      stream_url="https://www.youtube.com/watch?v=uIdJ3BjhkaU" # Andersen .Paak mix
      ;;
    5)
      stream_url="https://www.youtube.com/watch?v=UI5NKkW8acM&pp=ygUIc3RlZXp5YWY%3D" # Steezyaf Coffee Shop Radio
      ;;
    *)
      printf "${YL1}Invalid choice:${NC} Enter a number between 1 and 5\n"
      ;;
  esac 
}

play_music() {
  printf "${BL1} ::${NC} ${GR1}Playing...${NC}\n"
  printf "${BL1} ::${NC} Press ${PR1}Ctrl+c${NC} to stop\n"
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

