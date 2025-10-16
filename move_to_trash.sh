#!/usr/bin/sh
# ==  move_to_trash.sh  ======================================
# Description:
# - Moves files or directories to the $TRASH
# Author: chris4727
# Dependancies:
# - printf

check_trash() {
  if [ -z $TRASH ]; then
    printf "${RD1}==> Error:${NC} \$TRASH not defined\n"
    printf "${BL1}==>   Add:${NC} export TRASH=\"\$HOME/.local/share/Trash\" ${PR1}to \$HOME/.bashrc${NC}\n"
    exit 1
  fi
}

check_args() {
  if [ "$#" -lt 1 ]; then
    printf "${RD1}==> Error:${NC} You didn't indicate anything to move to the trash\n"
    printf "${GR1}==> Useage:${NC} move_to_trash.sh ${PR1}<stuff-to-delete>${NC}\n"
    exit 1
  fi
}

trash() {
  printf "${GR1}==> ${NC}Moving files to trash\n"
  for file in "$@"; do
    mv $file $TRASH
    printf "${BL1} -> ${PR1}$file ${NC}moved to trash\n"
  done
  printf "${GR1}==> ${NC}Files moved to ${PR1}$TRASH${NC}\n"
}

main() {
  check_trash
  check_args "$@"
  trash "$@"
}

main "$@"

