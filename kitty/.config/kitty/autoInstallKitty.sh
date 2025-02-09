#!/bin/bash

echo "Updating package list ...."
sudo apt update

# Install dependencies
#sudo apt install -y python3 python3-pip

# Download the latest Kitty release
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
  dest=~/.local/bin/

# Create link for kitty
ln -sf ~/.local/bin/kitty.app/bin/kitty ~/.local/bin/kitty.app/bin/kitten ~/.local/bin/
sudo ln -sf ~/.local/bin/kitty.app/bin/kitty ~/.local/bin/kitty.app/bin/kitten /usr/bin/
# Place kitty.desktop file 
cp ~/.local/bin/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/bin/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
cp ~/.local/bin/kitty.app/share/icons/ ~/.local/share/icons/
# Update the paths to the kitty and its icon in the kitty desktop files
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/bin/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty".desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/bin/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty".desktop
# Make xdg-terminal-exec 
echo "kitty.desktop" > ~/.config/xdg-terminals.list

# Verify Installation
if command -v kitty &> /dev/null then
  echo "Kitty installed successfully! Version: $(kitty --version)"
else
  echo "Kitty installation failed ....!!"
fi

