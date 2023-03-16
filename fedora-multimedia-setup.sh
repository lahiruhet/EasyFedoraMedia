#!/bin/bash

# Add RPM Fusion repositories
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install multimedia packages
sudo dnf install \
  gstreamer1-plugins-{bad,good,base} \
  gstreamer1-plugin-openh264 \
  gstreamer1-libav \
  lame \
  mpv \
  --exclude=gstreamer1-plugins-bad-free-devel

# Upgrade multimedia packages
sudo dnf group upgrade --with-optional Multimedia

# Enable Cisco OpenH264 repository
sudo dnf config-manager --set-enabled fedora-cisco-openh264

# Install OpenH264 plugin for Mozilla
sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264

