#!/usr/bin/sh
# ==  move_to_trash.sh  ======================================
# Description: 
# Author: chris4727
# Dependancies: 

check_trash() {
  if [ -z $TRASH ]; then
    printf "${RD1}==> Error:${NC} \$TRASH not defined\n"
    printf "${BL1}==>   Add:${NC} export TRASH=\"\$HOME/.local/share/Trash\" ${PR1}to \$HOME/.bashrc${NC}\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -lt 1 ]; then
    printf "${RD1}==> Error:${NC} You didn't indicate anything to move to the trash\n"
    printf "${GR1}==> Useage:${NC} move_to_trash.sh ${PR1}<stuff-to-delete>${NC}\n"
    exit 1
  fi
}

trash() {
  for file in "$@"; do
    printf "${BL1} -> ${PR1}$file${NC} moved to trash\n"
  done
}

main() {
  check_trash
  #echo_vars
  check_args "$@"
  trash "$@"
}

main "$@"

