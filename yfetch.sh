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
# cpu
get_cpu(){
    cpu_name="$(sysctl -n machdep.cpu.brand_string)"
    echo "CPU :" "$cpu_name"
}
# gpu
# memory
# resolution
#



#ui
get_user
get_uptime
get_shell
get_os
get_cpu
