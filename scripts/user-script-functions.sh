#!/bin/bash

# functions
add_applications_to_favourites(){
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'opera_opera.desktop', 'chromium_chromium.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'code_code.desktop', 'postman_postman.desktop', 'spotify_spotify.desktop', 'pgadmin4.desktop', 'discord_discord.desktop']"
}

generate_ssh_key_and_copy_to_clipboard(){
echo | ssh-keygen -t ed25519 -C  "${GIT_EMAIL_ADDRESS}" -y
eval "$(ssh-agent -s)"
ssh-add /home/"${USER}"/.ssh/id_ed25519
xclip -selection clipboard < /home/"${USER}"/.ssh/id_ed25519.pub
}

add_pygrid_to_autostart(){
cp autostart/pygrid.py.desktop /home/"${USERNAME}"/.config/autostart
}

config_monitors(){
# clear monitors.xml file
:> /home/konrad/.config/monitors.xml

# insert monitors` configuration to config file
echo -e '0r configuration/monitors.xml\nw' | ed /home/konrad/.config/monitors.xml

xrandr --output DP-0 --primary --rotate normal --mode 2560x1080 --pos 0x0 --rate 60
xrandr --output HDMI-0 --rotate right --mode 1920x1080 --pos 2560x-120 --rate 60
}