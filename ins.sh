#!/bin/bash
echo "hacking your shi twin...JK"

cp niri.kdl ~/.config/niri/config.kdl
cp noctaliastate.toml ~/.local/state/noctalia/state.toml
cp noctaliasettings.toml ~/.local/state/noctalia/settings.toml

read -p "Chimera Linux Noctalia Install. Y/N?" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
doas apk add noctalia xdg-desktop-portal gnome-keyring libsecret networkmanager flatpak
echo "Installing."
else

 echo "Skipping Chimera Linux Stuff"
fi

read -p "This will overwrite your noctalia config. Y/N?" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
mkdir -p ~/.local/state/noctalia

cp niri.kdl ~/.config/niri/config.kdl
cp noctaliastate.toml ~/.local/state/noctalia/state.toml
cp noctaliasettings.toml ~/.local/state/noctalia/settings.toml
 echo "overwriting"
else "nothing overwrote."
fi

read -p "This will overwrite your niri config (I DO NOT RECOMMEND TS). Y/N?" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
mkdir -p ~/.config/niri/

cp niri.kdl ~/.config/niri/config.kdl
echo "overwriting"
else
echo "nothing overwrote"
fi

read -p "Install Noctalia Greetd Greeter (ngl ts only for chimera only idfk bout other distros.) Y/N?" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
doas apk add greetd noctalia-greeter
doas mkdir -p /etc/greetd/
doas cp greetd.toml /etc/greetd/config.toml
echo "noctalia greetd installed"
else
 echo "Skipping greetd"
fi

read -p "Install flathub repo? Y/N" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Your larp files, my good sir."
else
 echo "Skipping flathub"
fi
read -p "Install flathub apps (roblox, discord, steam. AND USE ONLY WHEN ACCEPTED THE REPO)? Y/N" response
if [[ "$response" =~ ^[yY](es)?$ ]]; then
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.discordapp.Discord org.vinegarhq.Sober com.valvesoftware.Steam
echo "installing flathub apps"
else
 echo "Skipping flathub apps"
fi
