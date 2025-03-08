#!/bin/bash

# installing flatpak itself, it is usally pre-installed.
dnf install -y flatpak

# installing the flatpaks
flatpak install --assumeyes flathub app.zen_browser.zen
flatpak install --assumeyes com.visualstudio.code

