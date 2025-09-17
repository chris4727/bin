#!/bin/bash
#spinner=( "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" )
spinner=( "⢎⡰" "⢎⡡" "⢎⡑" "⢎⠱" "⠎⡱" "⢊⡱" "⢌⡱" "⢆⡱" )
#spinner=( "   " "   " ".  " ".. " "..." "..." "..." )
#spinner=( "[    ]" "[=   ]" "[==  ]" "[=== ]" "[====]" "[ ===]" "[  ==]" "[   =]" )
#spinner=( "🕛" "🕐" "🕑" "🕒" "🕓" "🕔" "🕕" "🕖" "🕗" "🕘" "🕙" "🕚" )
i=0

while pgrep -f /usr/bin/ghb > /dev/null; do
  printf "\e[H\e[2J"
  eza -lah
  echo -ne "\r\nHandbrake is Transcoding ${spinner[$i]}"
  ((i=(i+1)%${#spinner[@]}))
  sleep 0.2 
done

