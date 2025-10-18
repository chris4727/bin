#!/usr/bin/env bash

#      read_ascii() {
#          # 'PF_COL1': Set the info name color according to ascii color.
#          # 'PF_COL3': Set the title color to some other color. ¯\_(ツ)_/¯
#          PF_COL1=${PF_COL1:-${1:-7}}
#          PF_COL3=${PF_COL3:-$((${1:-7}%8+1))}
#
#          # POSIX sh has no 'var+=' so 'var=${var}append' is used. What's
#          # interesting is that 'var+=' _is_ supported inside '$(())'
#          # (arithmetic) though there's no support for 'var++/var--'.
#          #
#          # There is also no $'\n' to add a "literal"(?) newline to the
#          # string. The simplest workaround being to break the line inside
#          # the string (though this has the caveat of breaking indentation).
#          while IFS= read -r line; do
#              ascii="$ascii$line
#  "
#          done
#      }
select_pokemon() {
  printf "${BL1} ::${NC} What is your favorite ${PR1}Pokemon${NC}?\n"
  printf "${GR1}    1. ${NC} ${GR1}Bulbasaur${NC}\n"
  printf "${GR1}    2. ${NC} ${PR1}Ghastly${NC}\n"
  printf "${GR1}    3. ${NC} ${PR1}Gengar${NC}\n"
  printf "${GR1}    4. ${NC} ${YL1}Pikachu${NC}\n"
  printf "${GR1}    5. ${NC} ${BL1}Squirtle${NC}\n"

  read -p "Enter selection (1-5): " choice

  case $choice in
      1)
        echo -e "$(
        cat << EOF

${GR1} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⡀⠈⡖⡤⠄⠀
${CY1} ⠀⠀⢀⡀⠀⠀${GR1}⠀⡐⠁⠀⠀⠠⠐⠂⠀⠁⠀⠀⠀⠀
${CY1} ⠀⠰⡁⠐⢉⣉⣭⡍⠁⠂⠉⠘⡀⠀⠀⠀⠀${GR1}⠂⠡⠀
${CY1} ⢀⣊⠀⡄⠻⠿⠋⠀⠀⠀⠀⠀${GR1}⢃⠀⠀⠀⠀⠀⠀⢀
${FG1} ⡎⣾⠀⠁${CY1}⣴⡆⠀${FG1}⠡⢺⣿⣆⠀${CY1}⢠⢱⣄⠀${GR1}⠀⠀⠀⠈
${FG1} ⡑⠟⠀⠀⠀⠀⠀⢀⣸⡿⠟⠀⠀${CY1}⠈⢿⣿⡦⡀⠀${GR1}⡰
${CY1} ⠙⠔⠦⣤⣥⣤⣤⣤⡤⠆⠀⠀⠀⠀⢀⢀⠀⠈⠎⠀
${CY1} ⠀⠀⠈⣰⡋⢉⠉⠁⠒⠂⢇⢠⡆⠀⠸⢴⣿⠀⠘⠀
${CY1} ⠀⠀⠘⡿⠃⠀⠨⠒⢆⣸⣿⠁⠀⡠⡇⠈⠋⠀⠰⠀
${CY1} ⠀⠀⠀⠛⠒⠒⠁⠀⠈⠷⡤⠤⠐⠀⠘⠒⠒⠖⠁⠀${NC}
EOF
        printf "${GR1}Bulbasaur:${NC} The ${GR1}grass${NC} type Pokemon\n"
          )"
        ;;
      2)
        echo -e "$(
        cat << EOF

${PR1}⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠔⠉⠒⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⠀⠀⠀⢧⣀⡀⡀⠀⠀⠑⢢⢀⢄⡀⠔⠂⠐⠂⢄⠀⠀
${PR1}⠀⠀⡠⠒⠒⣬⡒⠊⠐⠁⠂⠂⠀${BG1}⣀⣀⣈${PR1}⠪⠂⠀⠀⠀⠀⠀⠀⠆⠀
${PR1}⠀⠀⢇⡠⡲⠗⠁⠀⠀${BG1}⢀⠔⠊⠁⠀⠀⠀⠈⠑⠢⡀${FG1}⣠⠀⠀${PR1}⣀⡸⠀
${PR1}⠀⠀⠀⠀⠧⠤⢄⠀${FG1}⡰⢅⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠋⠆⠀${PR1}⠑⡀⠀
${PR1}⠀⠀⠀⡰⠉⠑⠊${BG1}⠰${FG1}⡇⠀⠉⠢⢄⠀⠀⠀⠀⠀⢀⠇⠀⠸⠀${PR1}⡔⠁⠀
${PR1}⢀⣀⠸⠀⠀⠀⠀${BG1}⡆${FG1}⢇⠀⠀⠀⠀⡍⠢⣀⠀⢀⠎⠇⠀⢀⠇${PR1}⠙⢆⡀
${PR1}⠘⠤⢤⣊⢱⠀⠀${BG1}⢡${FG1}⠈⠢⡀⠀⠈⠀⢀⠌⠀⠀⠣⠤⣤⡺${PR1}⢠⡀⢀⡇
${PR1}⠀⠀⡅⢀⠏⡂⠀${BG1}⠈⢆⠀${FG1}⠈⣅⠈⠈⢁⣀⡠⠄⢒⠞⡧⠃${PR1}⠓⡗⠜⠁
${PR1}⠀⠀⢠⠖⠤⠅⠀${BG1}⠀⠀⠑⢄${FG1}⠈⠣⠓⠑ ⠒⠒⠒⠉${PR1}⢀⠔⢡⣠⠋⠁⠀⠀
${PR1}⠀⠀⠀⠣⣀⡀⠤⢄⠀⠀⠀${BG1}⠈⠑⠂⠀⠒⠒⠈⠀⠀${PR1}⠈⠐⡆⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⠀⠀⠀⠁⠜⠋⡀⣰⠀⠀⢀⣀⡀⠀⢨⠃⠀⣱⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠦⠔⠩⠤⠒⠊⠁⠀⠈⠑⠉⠒⠉⠀⠀⠀⠀
EOF
        printf "${PR1}Ghastly:${NC} The ${PR1}ghost${NC} type Pokemon\n"
          )"
        ;;
      3)
        echo -e "$(
        cat << EOF

${PR1}⠀⠀⠀⠀⠀⢸⠓⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⢸⠀⠀⠑⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠙⢤⡷⣤⣦⣀⠤⠖⠚⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⣠⡿⠢⢄⡀⠀⡇⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠸⠷⣶⠂⠀⠀⠀⣀⣀⠀⠀⠀
${PR1}⢸⣃⠀⠀⠉⠳⣷⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⢉⡭⠋
${PR1}⠀⠘⣆⠀⠀⠀⠁${RD1}⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${PR1}⠀⠀⠀⠀⢀⡴⠋⠀⠀
${PR1}⠀⠀⠘⣦⠆⠀⠀${RD1}⢀⡎⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀${PR1}⠀⡀⣠⠔⠋⠀⠀⠀⠀
${PR1}⠀⠀⠀⡏⠀⠀⣆${RD1}⠘⣄⠸⢧⠀⠀⠀⠀⢀⣠⠖⢻⠀⠀${PR1}⠀⣿⢥⣄⣀⣀⣀⠀⠀
${PR1}⠀⠀⢸⠁⠀⠀⡏⢣⣌${RD1}⠙⠚⠀⠀⠠⣖⡛⠀⣠⠏⠀⠀${PR1}⠀⠇⠀⠀⠀⠀⢙⣣⠄
${PR1}⠀⠀⢸⡀⠀⠀⠳⡞⠈⢻⠶⠤⣄⣀⣈⣉⣉⣡⡔⠀⠀⢀⠀⠀⣀⡤⠖⠚⠀⠀
${PR1}⠀⠀⡼⣇⠀⠀⠀⠙⠦⣞⡀⠀⢀⡏⠀⢸⣣⠞⠀⠀⠀⡼⠚⠋⠁⠀⠀⠀⠀⠀
${PR1}⠀⢰⡇⠙⠀⠀⠀⠀⠀⠀⠉⠙⠚⠒⠚⠉⠀⠀⠀⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⢧⡀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⠀⠙⣶⣶⣿⠢⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⠉⠀⠀⠀⠙⢿⣳⠞⠳⡄⠀⠀⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
${PR1}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠹⣄⣀⡤⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
        printf "${PR1}Gengar:${NC} The ${PR1}ghost${NC} type Pokemon\n"
          )"
        ;;
      4)
        echo -e "$(
        cat << EOF

EOF
        printf "${YL1}Pikachu:${NC} The ${YL1}electric${NC} type Pokemon\n"
          )"
        ;;
      5)
        echo -e "$(
        cat << EOF

EOF
        printf "${BL1}Squirtle:${NC} The ${BL1}water${NC} type Pokemon\n"
          )"
        ;;
      *)
      printf "No Pokemon selected\n"
      exit 1
      ;;
  esac
}

main() {
  select_pokemon
}

main "$@"
      # Using '<<-EOF' is the only way to loop over a command's
      # output without the use of a pipe ('|').
      # This ensures that any variables defined in the while loop
      # are still accessible in the script.
      #done <<-EOF
      #$(printf %s "$ascii" | sed 's/^[\[3.m//g')
    #EOF
#}
#!/usr/bin/sh

#cat << EOF
#EOF
##!/usr/bin/sh
#
#cat << EOF
#EOF
##!/usr/bin/env bash
#
#cat << EOF
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⣿⣷⣶⡤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠈⠻⣿⣇⠀⠉⠓⢤⡀⠀⠀⠀⠀⠀⠀⣸⠁⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠙⠷⣦⣄⣀⠙⠒⠒⠒⠲⠤⣀⡟⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⡸⠁⣀⠀⠀⠀⠀⠀⠈⠁⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⣰⡇⠘⠗⠁⠀⡀⠀⢀⢄⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⢰⣿⡟⠀⠀⣶⣾⣦⡄⠘⠛⠁⡎⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⢀⣀⠷⢀⡀⠀⢿⣿⠟⠁⠀⣴⣾⠋⠉⠁⢺⠆⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⢰⠃⠀⠀⠀⠀⠑⢂⡀⠀⠀⡀⠝⠁⠀⢀⠄⠉⠉⠒⠒⠲⠤⢤⣀⡀⠀
#⠀⠀⠀⠘⢶⣠⣀⠠⠤⠀⠃⠀⠀⠀⠀⠀⢄⡶⡟⠠⠀⡀⠀⠀⠀⠀⠀⠀⡩⠃
#⠀⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡥⣴⠇⠬⡼⢯⣶⣠⣀⠀⡠⠊⠀⠀
#⠀⠀⠀⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⣠⣄⠟⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀
#⠀⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⣹⠦⠴⣀⣠⣀⣤⣐⡴⢐⢠⢠⣀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠘⠟⠒⠒⠋⠁⠀⠈⠉⠉⠛⠻⠯⢭⣝⣳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#EOF
##!/usr/bin/env bash
#
#cat << EOF
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠐⠒⠒⠂⠠⡀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠊⠀⠀⡠⢠⠂⠀⠀⠀⠡⡀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⢰⣷⣾⠀⠀⠀⠀⠀⡇⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠜⢨⠢⠔⡀⠀⠠⠘⠛⠛⠀⠀⠀⠀⢸⡇⠀
#⠀⠀⠀⢀⣀⣀⠀⠀⠀⠰⠀⠀⠀⠀⠡⡀⠀⠈⠀⠒⠂⠄⡀⢀⠀⡀⠀
#⠀⡴⠊⠀⠀⠀⠉⢆⠀⡔⢣⠀⠀⠀⠀⠐⡤⣀⠀⠀⠀⠀⠀⣀⠄⠀⠀
#⢸⠀⠀⠀⢠⠀⠀⠈⣼⠀⠀⠣⠀⠀⠀⡰⡀⠀⠉⠀⠀⠰⠉⠀⠁⠠⢄
#⢰⠀⠀⠀⠀⠇⠀⢀⢿⠀⢀⠇⡐⠀⠈⠀⠈⠐⠠⠤⠤⠤⠀⠀⠀⠀⢨
#⠀⢓⠤⠤⠊⠀⠀⢸⠀⠣⠀⡰⠁⠀⠀⡀⠀⠀⠀⠸⠀⢰⠁⠐⠂⠈⠁
#⠀⠀⠑⢀⠀⠀⠀⠈⣄⠖⠉⠑⢄⠠⠊⠀⠢⢄⣠⣃⣀⡆⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠑⠠⢀⣀⠎⠀⠀⠀⠈⡄⠀⠀⠀⢠⢃⠠⠃⠐⡀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⠀⠀⢀⠯⠉⠤⢴⡃⠁⠀⠀⠀⡇⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠰⡁⠀⠀⠀⠠⠂⠀⠀⠀⠀⠑⢄⠀⠀⢀⠲⠁⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠘⠒⠑⠔⠁⠀⠀⠀⠀⠀⠀⠀⠁⠉⠀⠀⠀⠀⠀⠀
#EOF
