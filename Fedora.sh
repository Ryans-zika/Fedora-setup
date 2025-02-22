#!/bin/bash

echo "Atualizando o sistema..."
sudo dnf update -y

mkdir .themes .icons
wget https://github.com/dracula/gtk/archive/master.zip
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip

unzip Dracula.zip
mv dracula .themes/ 

unzip master.zip
mv gtk-master/ Dracula
mv dracula .themes/

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"

echo "ativando o repositório fusion"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "instalando os programas RPM, flatpak e drivers de video"
sudo dnf install -y flatpak git gnome-tweaks.noarch gimp steam timeshift python3-pip piper mesa-dri-drivers mesa-va-drivers mesa-vdpau-drivers discord

echo "adicionando o repositório do flathub"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "clonando o repositório do git"
git clone https://github.com/IsRengel/InstallCursorEditorLinux.git --depth=1 && cd InstallCursorEditorLinux && ./install.sh && cd .. && rm -rf InstallCursorEditorLinux

echo "Instalando programas via Flatpak..."

flatpak install -y \
    flathub org.gnome.Extensions \
    flathub app.zen_browser.zen \
    flathub com.spotify.Client \
    flathub md.obsidian.Obsidian \
    flathub com.bitwarden.desktop \