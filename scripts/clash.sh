#!/bin/bash

cfw(){
	cd /home/cyn/tools/clash
	./cfw -d
	
}


nw(){

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

switch_to_manual() {
    gsettings set org.gnome.system.proxy mode 'manual'
    echo -e "${GREEN}Switched to manual mode${RESET}"
}

switch_to_none() {
    gsettings set org.gnome.system.proxy mode 'none'
    echo -e "${GREEN}Switched to none mode${RESET}"
}

set_terminal_proxy_custom_company() {
    export https_proxy=192.168.0.245:7890
    export http_proxy=192.168.0.245:7890
    echo -e "${YELLOW}Company terminal proxy set${RESET}"
}

set_terminal_proxy_custom_mine() {
    export https_proxy=localhost:7890
    export http_proxy=localhost:7890
    echo -e "${YELLOW}Custom terminal proxy set${RESET}"
}

cancel_terminal_proxy() {
    unset https_proxy
    unset http_proxy
    echo -e "${RED}Terminal proxy canceled${RESET}"
}

print_help() {
    echo "Usage: nw [mode]"
    echo "Options:"
    echo "  h     Show this help message"
    echo "Modes:"
    echo "  1      Switch network to manual"
    echo "  2      Switch network to none"
    echo "  3      Set company terminal proxy"
    echo "  4      Set my terminal proxy"
    echo "  5      Cancel terminal proxy"
}

# Parse command-line arguments
case $1 in
    -h)
        print_help
        ;;
    1)
        switch_to_manual
        ;;
    2)
        switch_to_none
        ;;
    3)
        set_terminal_proxy_custom_company
        ;;
    4)
        set_terminal_proxy_custom_mine
        ;;
    5)
        cancel_terminal_proxy
        ;;
    *)
        echo "Error: Invalid option. Use 'nw -h' for help."

        ;;
esac

}