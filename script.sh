#!/bin/bash

# declare STRING variables

# script body
apt-get update -y
apt-get upgrade -y

while read -r p; do sudo snap install $p ; done < <(cat << "EOF"
    spotify
    discord
    --classic code
    intellij-idea-ultimate --classic
    postman
EOF
)

while read -r p; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    opera-stable
    firefox
    chromium-browser
    obs-studio
    curl
EOF
)

### pgadmin4

# Install the public key for the repository:
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#
# Install pgAdmin
#

# Install for both desktop and web modes:
sudo apt install pgadmin4 -y


# jdk
# docker
# pygrid https://github.com/pkkid/pygrid
