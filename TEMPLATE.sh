
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
  if ! command -v "printf" &> /dev/null
  then
    printf "${red}Error:${nc} printf is not installed\n"
    exit 1
  fi
}

#echo_vars() {
#   For debugging
#}

check_args() {
  if [ "$#" -ne 0 ]; then
    printf "${red}Error:${nc} This script expects no arguments\n"
    printf "${grn}Usage:${nc} TEMPLATE.sh ${prp}<argument>${nc}\n"
    exit 1
  fi
}

hello_world() {
  printf "${prp}Hello world!${nc}\n"
}

main() {
  vars "$@"
  check_dependencies
  #echo_vars
  check_args "$@"
  hello_world
}

main "$@"

