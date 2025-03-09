#!/bin/bash

NATIVE_PROGRAMS_SCRIPT="./Scripts/programs.native.sh"
FLATPAK_PROGRAMS_SCRIPT="./Scripts/programs.flatpak.sh"

# ------------------------------------------------------
# UTILITY FUNCTIONS FOR BETTER FLEXIBILITY AND CODE ORGANIZATION.
# ------------------------------------------------------
install_all_programs() {
  if [[ -f "$NATIVE_PROGRAMS_SCRIPT" ]]; then
    "$NATIVE_PROGRAMS_SCRIPT"
  fi

  if [[ -f "$FLATPAK_PROGRAMS_SCRIPT" ]]; then
    "$FLATPAK_PROGRAMS_SCRIPT"
  fi
}

set_default_user_configs() {
  sudo -u  "$SUDO_USER" bash << EOF
  echo 'executing as "$SUDO_USER"'
  USER_SHELL_CONFIG_DIR="/home/$SUDO_USER/.bashrc.d"
  echo 'User config dir: "$USER_SHELL_CONFIG_DIR"'

  if [[ -d "$USER_SHELL_CONFIG_DIR" ]]; then
    echo 'user config dir: "$USER_SHELL_CONFIG_DIR"'

    # backing up the old configurations.
    echo "User Config Directory already exists, backing up files..."

    for config_file in "$USER_SHELL_CONFIG_DIR"/*; do
      config_file_name=$(basename "$config_file")
      mv "$config_file" "$USER_SHELL_CONFIG_DIR"/"$config_file_name".bak
      echo moved "$config_file" to "$USER_SHELL_CONFIG_DIR"/"$config_file_name".bak
    done
  fi

  # and loading the default configurations.
  SOURCE_CONFIG_DIR="./Configs/bashrc.d"

  if [[ -d "$SOURCE_CONFIG_DIR" ]]; then
    echo "found default configurations, setting them up..."
    cp -R "$SOURCE_CONFIG_DIR" "$HOME/.configs/"
    echo copied "$SOURCE_CONFIG_DIR" to "$HOME/.configs/"
  fi

EOF
}

# ------------------------------------------------------
# PHASE: CONFIGURE ADDITIONAL REPOS, INSTALL PROGRAMS.
# ------------------------------------------------------
install_all_programs

# ------------------------------------------------------
# PHASE: CONFIGURE USER ENV VARIABLES, CONFIGURATIONS.
# ------------------------------------------------------
set_default_user_configs

