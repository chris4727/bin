#!/usr/bin/sh
# ==  REMOVE WIKILINK  ===========================
# Description:
# - Removes markdown wikilinks [[such as this]] from a file
# Author: chris4727
# DependaNCies:
# - sed

vars() {
  argument="$1"
}

check_dependeNCies() {
  if ! command -v "sed" &> /dev/null
  then
    printf "${RD1}Error:${NC} sed is not installed\n"
    exit 1
  fi
}

check_args() {
  if [ "$#" -lt 1 ]; then
    printf "${RD1}Error:${NC} This script expects at least one argument\n"
    printf "${GR1}Usage:${NC} remove_wikilink.sh ${PR1}<file.md>${NC}\n"
    exit 1
  fi
}

dry_run() {
  printf "${BL1} ->${NC} Dry run:\n\n"
  sed -E 's/\[{2}|\]{2}//g' "$@"
  printf "\n${BL1} ::${NC} Check that output looks as intended\n"
}

confirm() {
  printf "${BL1}==>${NC} Apply to file? (n|Y)\n"

  read choice

  case $choice in
    y|Y)
      sed -Ei 's/\[{2}|\]{2}//g' "$@"
      printf "${GR1}==>${NC} WikiLinks removed from ${PR1}$@${NC}\n"
      ;;
    n|N)
      printf "${YL1}Aborting${NC}\n"
      ;;
    *)
      printf "${YL1}Invalid choice:${NC} Enter ${PR1}y${NC} or ${PR1}n${NC}\n"
      confirm
      ;;
  esac
}

main() {
  vars "$@"
  check_dependeNCies
  check_args "$@"
  dry_run "$@"
  confirm "$@"
}

main "$@"

