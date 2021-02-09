#!/bin/bash

# functions
add_applications_to_favourites(){
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'opera_opera.desktop', 'chromium_chromium.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'code_code.desktop', 'postman_postman.desktop', 'spotify_spotify.desktop', 'pgadmin4.desktop', 'discord_discord.desktop']"
}