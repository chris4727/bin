#!/usr/bin/sh
# ==  weather  ======================================
# Description:
#   Gets the weather for the current location, or accepts optional arguments
#   for the location
# Author: chris4727
# Dependancies:
# - curl

check_dependencies() {
  if ! command -v "astroterm" &> /dev/null
  then
    printf "${red}Error:${nc} astroterm is not installed\n"
    exit 1
  fi
}

run_astroterm() {
  astroterm --color --unicode --speed 100 --fps 8 --city Seattle
}

main() {
  check_dependencies
  run_astroterm
}

main "$@"

