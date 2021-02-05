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
    pgadmin4
EOF
)


# jdk
# docker
# pygrid https://github.com/pkkid/pygrid
