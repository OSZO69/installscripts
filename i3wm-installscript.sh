#!/bin/bash

# Update package lists and upgrade system
echo "Updating package lists and upgrading system..."
sudo pacman -Syu --noconfirm

# Install i3 window manager and dependencies
echo "Installing i3 window manager and dependencies..."
sudo pacman -S --noconfirm i3-wm i3status i3lock dmenu feh xorg-xbacklight

# Optional: Install additional tools
echo "Installing additional tools..."
sudo pacman -S --noconfirm suckless-tools compton arandr lxappearance

# Set up a basic i3 configuration
echo "Setting up basic i3 configuration..."
mkdir -p ~/.config/i3
cat <<EOL > ~/.config/i3/config
# Set mod key to Super (Windows key)
set \$mod Mod4

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier \$mod

# start a terminal
bindsym \$mod+Return exec i3-sensible-terminal

# kill focused window
bindsym \$mod+Shift+q kill

# start dmenu (a program launcher)
bindsym \$mod+d exec dmenu_run

# change focus
bindsym \$mod+j focus left
bindsym \$mod+k focus down
bindsym \$mod+l focus up
bindsym \$mod+semicolon focus right

# move focused window
bindsym \$mod+Shift+j move left
bindsym \$mod+Shift+k move down
bindsym \$mod+Shift+l move up
bindsym \$mod+Shift+semicolon move right

# split in horizontal orientation
bindsym \$mod+h split h

# split in vertical orientation
bindsym \$mod+v split v

# fullscreen mode toggle
bindsym \$mod+f fullscreen toggle

# change container layout
bindsym \$mod+s layout stacking
bindsym \$mod+w layout tabbed
bindsym \$mod+e layout toggle split

# toggle tiling / floating
bindsym \$mod+Shift+space floating toggle

# reload the configuration file
bindsym \$mod+Shift+c reload

# restart i3 inplace
bindsym \$mod+Shift+r restart

# exit i3
bindsym \$mod+Shift+e exit
EOL

echo "i3 installation and setup complete!"