#!/bin/bash

# Set the ANSI escape code for light green color
LIGHT_GREEN='\033[1;32m'
# Set the ANSI escape code for yellow color (for warnings)
YELLOW='\033[1;33m'
# Reset the color back to normal
RESET_COLOR='\033[0m'

# Array of configurations to symlink (format: source:target)
configs_Linux=(
  "../zshrc:~/.zshrc"
  "../vimrc:~/.vimrc"
  "../bashrc:~/.bashrc"
)

configs_Mac=(
  "../zshrc_Mac:~/.zshrc"
  "../vimrc:~/.vimrc"
  "../bashrc:~/.bashrc"
)

# Backup existing configuration files
backup_configs() {
  local backup_dir=~/backup_config_$(date +"%Y%m%d_%H%M%S")
  mkdir -p "$backup_dir"

  local config_array=("$@")  # Use the passed array as the config_array

  for config in "${config_array[@]}"; do
    local source_file="${config%%:*}"
    local target_file="${config#*:}"
    
    # Backup existing configuration files (if they exist)
    if [ -e "$target_file" ]; then
      echo -e "${YELLOW}Backing up existing $target_file..."
      mv "$target_file" "$backup_dir/"
    fi
  done
}

# Function to create symbolic links
create_symlinks() {
  local config_array=("$@")  # Use the passed array as the config_array

  for config in "${configs[@]}"; do
    local source_file="${config%%:*}"
    local target_file="${config#*:}"

    ln -s "$HOME/dotfile/$source_file" "$target_file"
  done
}

# Function to handle errors
handle_error() {
  local error_message=$1
  echo -e "\n${error_message}\nExiting..."
  exit 1
}

# Function to handle warnings
handle_warning() {
  local warning_message=$1
  echo -e "${YELLOW}${warning_message}${RESET_COLOR}"
}

# Ask the user for the operating system
echo -e "${LIGHT_GREEN}Which operating system are you using?"
echo "1. macOS"
echo "2. Linux"
echo -e "${RESET_COLOR}"



read -p "Enter your choice (1 or 2): " os_choice

# Check the user's choice and create symbolic links accordingly
case $os_choice in
  1)
    echo -e "${LIGHT_GREEN}Creating symbolic links for macOS..."
    backup_configs "${configs_Mac[@]}"
    create_symlinks "${configs_Mac[@]}"
    ;;
  2)
    echo -e "${LIGHT_GREEN}Creating symbolic links for Linux..."
    backup_configs "${configs_Linux[@]}"
    create_symlinks "${configs_Linux[@]}"
    ;;
  *)
    handle_error "Invalid choice."
    ;;
esac

# Set git editor to Vim
git config --global core.editor vim

echo -e "${LIGHT_GREEN}Configuration completed.${RESET_COLOR}"
