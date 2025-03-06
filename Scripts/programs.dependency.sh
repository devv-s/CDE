#!/bin/bash

# PROGRAMS REQUIRED TO SETUP MULTIPLE APPS.
dnf install -y --setopt=install_weak_deps=False \
cmake \
gcc \
gtk3-devel \
libglibutil-devel \
libdbusmenu-gtk3-devel \
gtk-layer-shell-devel \
