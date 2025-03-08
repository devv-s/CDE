#!/bin/bash

PROGS_INSTALL_SCRIPT="./Scripts/programs.dnf.sh"
USER_SHELL_CONFIGS="./Configs/.bashrc.d/"

# ------------------------------------------------------
# FUNCTIONS FOR BETTER FLEXIBILITY AND CODE ORGANIZATION.
# ------------------------------------------------------
install_all_programs() {
  "$PROGS_INSTALL_SCRIPT"
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
if [[ -f "$PROGS_INSTALL_SCRIPT" ]]; then
  install_all_programs
fi

# ------------------------------------------------------
# PHASE: CONFIGURE USER ENV VARIABLES, CONFIGURATIONS.
# ------------------------------------------------------
set_default_user_configs
