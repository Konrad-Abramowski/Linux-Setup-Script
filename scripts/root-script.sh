#!/bin/bash

# import
source ./scripts/root-script-functions.sh

# script body
update_ubuntu_and_packages

install_applications_with_snap
install_applications_with_apt-get
install_pgadmin4
install_jdk_and_setup_JAVA_HOME
install_docker
