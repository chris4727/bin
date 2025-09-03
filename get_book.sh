#!/usr/bin/bash
# ==  GET BOOK  ===============================
# Author: chris4727
# Downloads ebook and adds to Calibre library
# Dependencies:
# - calibredb

vars() {
  input_url="$1"
  # Set output directory to arg 2, or default to $HOME/music/ytdlp
  library="$HOME/Documents/Books/"
  output_dir="$HOME/Documents/Unsorted/"
  red="\033[0;31m"
  yel="\033[0;33m"
  blu="\033[0;34m"
  grn="\033[0;32m"
  prp="\033[0;35m"
  nc="\033[0m" # No Color
}

check_dep() {
  if ! command -v "calibredb" &> /dev/null
  then
    printf "${red}Error:${nc} calibredb is not installed.\n"
    exit 1
  fi
}

check_args() {
  if [ $# -ne 1 ]; then
    printf "${red}Error:${nc} This script expects one argument <input-url>\n"
    printf "${grn}Usage:${nc} get_book <url.com>\n"
    exit 1
  fi
}

get_book_info() {
  printf "${yel} ->${nc} Enter the ${blu}Author${nc} name (First Last): "
  read author
  printf "${yel} ->${nc} Enter the book ${blu}title${nc}: "
  read title
  filename="$author - $title".epub
}

echo_vars() {
  printf "$author\n"
  printf "$title\n"
  printf "$library\n"
  printf "$output_dir\n"
  printf "$output_dir$author - $title.epub\n"
  printf "$filename\n"
}

get_book() {
  printf "${blu}:: ${nc}Downloading ${prp}$title${nc} into ${blu}$output_dir${nc}\n"
  wget "$input_url" -O "$output_dir$filename"
  if [ $? -ne 0 ]; then
    printf "${red}Error:${nc} Download failed.\n"
    exit 1
  else
    printf "${grn}==>${nc} Download completed.\n"
  fi
}

add_to_library() {
  calibredb add "$output_dir$filename" -a "$author" -t "$title"
}

main() {
  vars "$@"
  check_dep
  check_args "$@"
  get_book_info
  #echo_vars
  get_book
  add_to_library
}

main "$@"


