#!/bin/bash

# installing flatpak itself, it is usally pre-installed.
dnf install flatpak

# installing the flatpaks
flatpak install flathub app.zen_browser.zen
flatpak install com.visualstudio.code

