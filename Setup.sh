#!/bin/bash

PROGS_INSTALL_SCRIPT="./Scripts/programs.dnf.sh"

# ------------------------------------------------------
# FUNCTIONS FOR BETTER FLEXIBILITY AND CODE ORGANIZATION.
# ------------------------------------------------------
install_all_programs() {
  "$PROGS_INSTALL_SCRIPT"
}

set_default_user_configs() {
  cp -R Configs/.bashrc.d/ ~/
}

# ------------------------------------------------------
# PHASE: CONFIGURE ADDITIONAL REPOS, INSTALL PROGRAMS.
# ------------------------------------------------------
if [[ -f "$PROGS_INSTALL_SCRIPT" ]]; then
  install_all_programs
fi
