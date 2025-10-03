#!/usr/bin/sh
# ==  COLOR SWATCH  ==============================
# Description:
# - Create .png from hex codes in markdown table from notes
# Author: chris4727
# Dependancies:
# - imagemagick


vars() {
  file="$1"
  red="\033[0;31m"
  yel="\033[0;33m"
  grn="\033[0;32m"
  blu="\033[0;34m"
  prp="\033[0;35m"
  nc="\033[0m"
}

check_dependencies() {
  if ! command -v "magick" &> /dev/null
  then
    printf "${red}Error:${nc} imagemagick is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -lt 1 ]; then
    printf "${red}Error:${nc} This script expects one argument\n"
    printf "${grn}Usage:${nc} color_swatch.sh ${prp}<#FFFFFF>${nc}\n"
    exit 1
  fi
}


mkcolor() {
  # Read the file and generate images
  # TODO Return ~/Notes/Rosepine theme.md without table header or the rest of
  # the file:
  #tail -n +3 Rosepine\ theme.md | head -n 27
  while IFS= read -r line; do
      # Skip empty lines
      [ -z "$line" ] && continue
  
      # Find colorname and hexcode
      colorname=$(echo "$line" | awk '{print $3}')
      hexcode=$(echo "$line" | awk '{print $5}')
  
      #Create small images from hex codes in table
      magick -size 150x50 xc:"$hexcode" "$colorname".png
      printf "${blu}::${nc} Created "$colorname.png"\n"
  done < "$file"
}

main() {
  vars "$@"
  check_dependencies
  #echo_vars
  check_args "$@"
  mkcolor
}

main "$@"



