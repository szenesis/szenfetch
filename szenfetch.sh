#!/bin/bash

print_system_info() {
  BLUE='\e[38;5;25m'; RESET='\e[0m'

  name="$(whoami)"; name="${name^}"
  time=$(date '+%I:%M%p')
  day=$(date '+%A, %B %d, %G')
  os=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
  ram=$(awk '/MemTotal/ {printf "%.2f GB", $2/1024/1024}' /proc/meminfo)
  cpu=$(awk -F ': ' '/model name/ {print $2; exit}' /proc/cpuinfo | sed 's/ @.*//')
  gpu=$(lspci 2>/dev/null | grep -iE 'vga|3d' | grep -iE 'nvidia|amd|intel' | sed -E 's/.*: (.*)/\1/' | head -n1)
  de=$(echo "${DESKTOP_SESSION:-Unknown}" | sed 's/.*/\L&/; s/^./\U&/')
  
  uph=$(uptime -p | grep -oP '\d+(?= hour)' || echo 0)
  upm=$(uptime -p | grep -oP '\d+(?= minute)' || echo 0)
  
  # Format uptime components
  [[ "$uph" -gt 0 ]] && printf -v uph_show " ${BLUE}%s${RESET} %s" "$uph" "$( [ "$uph" -eq 1 ] && echo hour || echo hours )"
  [[ "$upm" -gt 0 ]] && printf -v upm_show " ${BLUE}%s${RESET} %s" "$upm" "$( [ "$upm" -eq 1 ] && echo minute || echo minutes )"
  [[ "$uph" -gt 0 && "$upm" -gt 0 ]] && and_show=" and"

  # Display information
  echo ""
  printf " Howdy ${BLUE}%s${RESET}!\n" "$name"
  printf " Time is: ${BLUE}%s${RESET}\n" "$time"
  printf " Day: ${BLUE}%s${RESET}\n" "$day"
  echo " ------------------------------------------ "
  printf " OS: ${BLUE}%s${RESET}\n" "$os"
  printf " DE: ${BLUE}%s${RESET}\n" "$de"
  printf " Ram: ${BLUE}%s${RESET}\n" "$ram"
  echo " ------------------------------------------ "
  printf " GPU: ${BLUE}%s${RESET}\n" "${gpu:-Not detected}"
  printf " CPU: ${BLUE}%s${RESET}\n" "$cpu"
  echo " ------------------------------------------ "
  printf " Uptime:%s%s%s\n" "$uph_show" "$and_show" "$upm_show"
  echo ""
}

print_system_info
