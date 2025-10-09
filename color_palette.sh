#!/usr/bin/sh
# ==  COLOR SWATCH  ==============================
# Description:
# - Create .png from hex codes in markdown table from notes
# Author: chris4727
# Dependancies:
# - imagemagick


vars() {
  file="$1"
}

check_dependencies() {
  if ! command -v "magick" &> /dev/null
  then
    printf "${RD1}Error:${NC} imagemagick is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -lt 1 ]; then
    printf "${RD1}Error:${NC} This script expects one argument\n"
    printf "${grn}Usage:${NC} color_swatch.sh ${PR1}<#FFFFFF>${NC}\n"
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
      printf "${BL1}::${NC} Created "$colorname.png"\n"
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



