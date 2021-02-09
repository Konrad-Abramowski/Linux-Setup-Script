#!/bin/bash

# import
source ./setup-script-functions.sh

# declare STRING variables

script body
update_ubuntu_and_packages
config_git
install_applications_with_snap
install_applications_with_apt-get
install_pgadmin4
install_jdk_and_setup_JAVA_HOME
install_docker
# config_monitors

# ### pygrid https://github.com/pkkid/pygrid
# sudo apt-get install python3-gi python3-xlib -y
# cd /home/konrad
# git clone https://github.com/mjs7231/pygrid.git

# # run pygrid on startup
# touch /etc/rc.local

# startup_script_file='/etc/rc.local'
# if ! grep -q !/bin/bash "$startup_script_file"; then
# echo -e "#!/bin/sh -e\n
# xhost + local:\n
# /usr/bin/python3 /home/konrad/pygrid/pygrid.py\n
# exit 0" >> $startup_script_file
# fi

# sudo chmod +x /etc/rc.local

# sudo update-rc.d startup-script.sh defaults

# ### set postion of displays
# xrandr --output DP-0 --primary --rotate normal --mode 2560x1080 --pos 0x0 --rate 60
# xrandr --output HDMI-0 --rotate right --mode 1920x1080 --pos 2560x-415 --rate 60

# ### add applications to favourites
# gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'opera_opera.desktop', 'chromium_chromium.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'code_code.desktop', 'postman_postman.desktop', 'spotify_spotify.desktop', 'pgadmin4.desktop', 'discord_discord.desktop']"

# # run pygrid
# cd /home/konrad
# xhost + local:
# cd pygrid && ./pygrid.py