#!/bin/bash
# for mac only
#printf "%s" "$version"
version="0.0.1"









#os
get_os(){
    os_name="$(sw_vers -productName)"
    echo "os :" "$os_name"
}
# user
get_user(){
    echo "user :" "$USER"
}
# host
get_host(){
    echo "host :" "$HOSTNAME"
}
# uptime
get_uptime(){
    uptime_t="$(uptime)"
    uptime_t2=${uptime_t:11}
    echo "uptime :" "$uptime_t2"|cut -d ',' -f 1,2
}
# shell
get_shell(){
    shell="$(basename "$SHELL")"

    if [[ "$shell" == "zsh" ]];then
        version="$(zsh --version | awk '{print $2}')"
        echo "Shell :" "$shell $version"
    elif [[ "$shell" == "bash" ]]; then
        echo "Shell :" "$shell $BASH_VERSION"
    else
        echo "Shell :" "$shell"
    fi
}
# terminal
get_terminal(){
    echo "Terminal :"  "$TERM_PROGRAM"
}

# cpu
get_cpu(){
    cpu_name="$(sysctl -n machdep.cpu.brand_string)"
    echo "CPU :" "$cpu_name"
}
# gpu
get_gpu(){
    gpu="$(system_profiler SPDisplaysDataType | awk -F': ' '/Chipset Model/ {print $2; exit}')"
    echo "GPU: $gpu"
}
# memory
get_memory(){
    memory="$(($(sysctl -n hw.memsize) / 1024 / 1024))"
    echo "memory :" "$memory" MB
    #implement used memory later
}
# resolution
#


#ui
RED='\033[0;31m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

BANNER='__   __ _____  _____  _____ ____ _   _
\ \ / /|  ___||  ___||_   _/ ___| | | |
 \ V / | |_   | |__    | || |   | |_| |
  | |  |  _|  |  __|   | || |___|  _  |
  |_|  |_|    |_ ___|  |_|| \___|_| |_|'

BANNER_WIDTH=41  # actual character width of the banner

cols=$(tput cols 2>/dev/null || echo 80)

if [ "$cols" -ge "$BANNER_WIDTH" ]; then
  echo -e "${CYAN}${BOLD}"
  echo "$BANNER"
  echo -e "${RESET}"
else
  echo -e "${CYAN}${BOLD}YFETCH${RESET}"
fi

#if you want to display image uncommnet this you also need to have catimg installed 
#change the img with wtv you want and play with the width and height 
#catimg -w 60 miku_bsh.png


get_user
get_host
get_uptime
get_shell
get_os
get_cpu
get_memory
get_gpu
get_terminal
