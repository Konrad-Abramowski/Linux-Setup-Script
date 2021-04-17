#!/bin/bash

# import
source ./scripts/user-script-functions.sh

# variables
GIT_EMAIL_ADDRESS="abramowski.konrad@gmail.com"
USERNAME="konrad"

# script body
config_monitors
add_applications_to_favourites 
generate_ssh_key_and_copy_to_clipboard $GIT_EMAIL_ADDRESS $USERNAME
install_pygrid
add_pygrid_to_autostart $USERNAME
