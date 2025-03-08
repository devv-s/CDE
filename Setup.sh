#!/bin/bash

NATIVE_PROGRAMS_SCRIPT="./Scripts/programs.native.sh"
FLATPAK_PROGRAMS_SCRIPT="./Scripts/programs.flatpak.sh"
USER_SHELL_CONFIGS="./Configs/.bashrc.d/"

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
  USER_SHELL_CONFIG_DIR="$HOME/.bashrc.d"

  if [[ -d "$USER_SHELL_CONFIG_DIR" ]]; then
    # backing up the old configurations.
    for config_file in "$USER_SHELL_CONFIG_DIR"/*; do
      config_file_name=$(basename "$config_file")
      mv "$config_file" "$USER_SHELL_CONFIG_DIR"/"$config_file_name".bak
    done

    # and loading the default configurations.
    config_dir="./Configs/bashrc.d"
    if [[ -d "$config_dir" ]]; then
      cp "$config_dir" "$HOME/.configs/"
    fi
  fi
}

# ------------------------------------------------------
# PHASE: CONFIGURE ADDITIONAL REPOS, INSTALL PROGRAMS.
# ------------------------------------------------------
  install_all_programs

# ------------------------------------------------------
# PHASE: CONFIGURE USER ENV VARIABLES, CONFIGURATIONS.
# ------------------------------------------------------
set_default_user_configs
