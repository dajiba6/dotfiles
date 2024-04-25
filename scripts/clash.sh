#!/bin/bash
# =============================================================
cfw(){
	cd $HOME/tools/clash
	./cfw -d
	
}

ob(){
  cd $HOME/Documents/cyn_vault
  if [ "$1" = "l" ]; then
    git pull
  elif [ "$1" = "p" ]; then
    git push
  else
    cd $HOME/tools/Obsidian
    ./Obsidian-1.5.11.AppImage
  fi
}

# =============================================================
nw(){
CYAN="\033[1;36m"
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'
LIGHT_GREEN="\033[1;32m"

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
    export https_proxy=https://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    echo -e "${YELLOW}Custom terminal proxy set${RESET}"
}

cancel_terminal_proxy() {
    unset https_proxy
    unset http_proxy
    echo -e "${RED}Terminal proxy canceled${RESET}"
}

print_help() {
    echo -e "${CYAN}Usage: nw [mode]"
    echo "Modes:"
    echo -e "${LIGHT_GREEN}  1      Switch network to manual"
    echo "  2      Switch network to none"
    echo "  3      Set company terminal proxy"
    echo "  4      Set my terminal proxy"
    echo -e "  5      Cancel terminal proxy${RESET}"
}

# Parse command-line arguments
case $1 in

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
        print_help

        ;;
esac

}
# ====================================================
# flameshot() {
#   ~/tools/flameshot/Flameshot-12.1.0.x86_64.AppImage gui
# }
