#!/bin/bash

# path to the script responsible for enabling the repositories.
REPO_SCRIPT="./repositories.sh"
DEPENDENCY_SCRIPT="./programs.dependency.sh"

get() {
  dnf install -y --setopt=install_weak_deps=False "$@"
}

# Installing system libraries and general dependencies.
if [[ -f "$DEPENDENCY_SCRIPT" ]]; then
  "$DEPENDENCY_SCRIPT"
fi

get \
axel \
git \
neovim \
qbittorrent \
torbrowser-launcher


# ------------------------------------------------------------------------
# FOLLOWING ARE THE PACKAGES FROM EXTERNAL OR NON-STANDARD REPOSITORIES
# THESE MUST BE INSTALLED/CONFIGURED/ENABLED TO AVAIL THE RESPECTIVE APPS.
# ------------------------------------------------------------------------

# Enabling Repos (if not already)
if [[ -f "$REPO_SCRIPT" ]]; then
  "$REPO_SCRIPT"
fi

get ghostty			# from pgdev/ghostty
get vlc				# from rpmfusion-free
get --allowerasing ffmpeg	# from rpmfusion-free
