#!/usr/bin/env sh

echo "hacking your shi twin...JK"

printf "Chimera Linux Noctalia Install. Y/N? " 
read -r response
case  "$response" in
 [yY]|[yY][eE][sS]) 
doas apk add noctalia xdg-desktop-portal-gnome gnome-keyring libsecret networkmanager flatpak fonts-nerd-jetbrains-mono nautilus gvfs 
echo "Installing."
	;;
	*)
	echo "Skipping Chimera Noctalia Install"
	;;
esac


printf "This will overwrite your noctalia config. Y/N? " 
read -r response 
case  "$response" in
 [yY]|[yY][eE][sS])
mkdir -p ~/.local/state/noctalia

cp niri.kdl ~/.config/niri/config.kdl
cp noctaliastate.toml ~/.local/state/noctalia/state.toml
cp noctaliasettings.toml ~/.local/state/noctalia/settings.toml
 echo "overwriting"
 ;;
*)
echo "Skipping Noctalia Config Overwrite (pretty sure you can figure it out)"
;;

esac
printf "This will overwrite your Niri config. (I do not recommend doing this) Y/N? "
read -r response
case  "$response" in
 [yY]|[yY][eE][sS])
mkdir -p ~/.config/niri/
cp niri.kdl ~/.config/niri/config.kdl
echo "overwriting"
 ;;
*)
echo "Skipping Niri Config Overwrite"
;;
esac

printf "This will install greetd + noctalia-greeter (only for chimera linux chuds) Y/N? "
read -r response
case  "$response" in
 [yY]|[yY][eE][sS])
doas apk add greetd noctalia-greeter
doas mkdir -p /etc/greetd/
doas cp greetd.toml /etc/greetd/config.toml
echo "Noctalia Greetd Installed"
 ;;
*)
echo "Skipping Greetd"
;;
esac

printf "Install Flathub repo? Y/N? "
read -r response
case  "$response" in
 [yY]|[yY][eE][sS])
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub Repo Installed"
 ;;
*)
echo "Skipping Repo Install"
;;
esac

printf "Install Flathub apps? (Discord, Steam, Sober client for Roblox) Y/N? "
read -r response
case  "$response" in
 [yY]|[yY][eE][sS])
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.discordapp.Discord org.vinegarhq.Sober com.valvesoftware.Steam
echo "installing flathub apps"
;;
*)
echo "Skipping Apps"
;;
esac
printf "Make Kitty seethru? (MEGA LARP) Y/N? "
read -r response
case  "$response" in
 [yY]|[yY][eE][sS])
mkdir -p ~/.config/kitty/
cp kitty.conf ~/.config/kitty/kitty.conf
echo "Installing Kitty Larp Config"
;;
*)
echo "LARP failed."
;;
esac
