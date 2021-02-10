#!/bin/bash

# import
source ./scripts/setup-script-functions.sh

# declare STRING variables

# script body
update_ubuntu_and_packages
config_git
install_applications_with_snap
install_applications_with_apt-get
install_pgadmin4
install_jdk_and_setup_JAVA_HOME
install_docker
config_monitors

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

# # run pygrid
# cd /home/konrad
# xhost + local:
# cd pygrid && ./pygrid.py
