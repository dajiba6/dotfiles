#!/bin/bash

cfw(){
	cd /home/cyn/tools/clash
	./cfw -d
	
}

nw(){
	proxy_mode=$(gsettings get org.gnome.system.proxy mode)
	if [[ $# -eq 0 ]]; then
	if [[ $proxy_mode == "'none'" ]]; then
	  gsettings set org.gnome.system.proxy mode 'manual'
	  echo "Switched to manual mode"
	else
	  gsettings set org.gnome.system.proxy mode 'none'
	  echo "Switched to none mode"
	fi
	elif [[ $1 == "m" ]]; then
	  gsettings set org.gnome.system.proxy mode 'manual'
	  echo "Switched to manual mode"
	elif [[ $1 == "n" ]]; then
	  gsettings set org.gnome.system.proxy mode 'none'
	  echo "Switched to none mode"
	elif [[ $1 == "s" ]]; then
	  export https_proxy=192.168.0.245:7890 && export http_proxy=192.168.0.245:7890	
	  echo "terminal network set"
	elif [[ $1 == "c" ]]; then
	  unset https_proxy && unset http_proxy
	  echo "terminal networl cancel"
	  else
	  echo "Invalid argument. Usage: proxy-switcher [m|n|s|c]"
	fi
}

