#!/bin/bash

echo "Atualizando o sistema..."
sudo dnf update -y

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "instalando os programas RPM, flatpak e drivers de video"
sudo dnf install -y flatpak git gimp steam timeshift python3-pip piper discord

echo "adicionando o repositório do flathub"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "clonando o repositório do git"

echo "Instalando programas via Flatpak..."

flatpak install -y \
    flathub com.spotify.Client \
    flathub md.obsidian.Obsidian \
    flathub com.bitwarden.desktop \