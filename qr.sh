#!/bin/sh
#== QR ===========================================
# Accepts argument, or piped inpus
# Encodes to a temporary QR code
# Set dependancies and functions
# TODO Detect if input is piped, or an argument
# Dependencies:
# - qrencode

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
  if ! command -v "qrencode" &> /dev/null
  then
    printf "${red}Error:${nc} qrencode is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_sdin() {
  # Check if input is stdin or arguments
  # If stdin, pass to qr_stdin
  # else, pass to check_args
}


check_args() {
  if [ "$#" -ne 0 ]; then
    printf "${red}Error:${nc} This script expects no arguments\n"
    printf "${grn}Usage:${nc} qr ${prp}<argument>${nc}\n"
    printf "${yel} or   ${nc}\n"
    printf "${grn}Usage:${nc} ${prp}<stdin>${nc} qr\n"
    exit 1
  fi
}

qr() {
  # Pass arguments to qrencode.
  # Output to a tmp file
  # Open the qr code
  qrencode "$1" -o $XDG_RUNTIME_DIR/qr.png && xdg_open $XDG_RUNTIME_DIR/qr.png &
}

qr_stdin() {
  # Pass stdin to qrencode.
  # Output to a tmp file
  # Open the qr code
  qrencode "$1" -o $XDG_RUNTIME_DIR/qr.png && xdg_open $XDG_RUNTIME_DIR/qr.png &
}

main() {
  vars "$@"
  check_dependencies
  #echo_vars
  #check_sdin "$@"
  check_args "$@"
  qr "$@"
  #qr_stdin
}

main "$@"

