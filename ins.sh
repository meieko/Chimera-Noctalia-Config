#!/bin/bash
echo "hacking your shi twin...JK"


mkdir -p ~/.config/niri/
mkdir -p ~/.local/state/noctalia

cp config.kdl ~/.config/niri/config.kdl
cp state.toml ~/.local/state/noctalia/state.toml
cp settings.toml ~/.local/state/noctalia/settings.toml

read -p "Install flathub apps? Y/N" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.discordapp.Discord org.vinegarhq.Sober com.valvesoftware.Steam 
echo "Your larp files, my good sir."
else 
 echo "Skipping flathub"
fi
