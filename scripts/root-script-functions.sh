#!/bin/bash

# functions
update_ubuntu_and_packages(){
    apt-get update -y
    apt-get upgrade -y
}


install_applications_with_snap(){ 
while read -r p; do sudo snap install $p ; done < <(cat << "EOF";
    spotify
    discord
    --classic code
    intellij-idea-ultimate --classic
    webstorm --classic
    postman
    opera
EOF
)
}

install_applications_with_apt-get(){
while read -r p; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    firefox
    chromium-browser
    obs-studio
    curl
    xclip
EOF
)
}

install_pgadmin4(){
# Install the public key for the repository:
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install pgAdmin4 for both desktop and web modes:
sudo apt install pgadmin4 -y
}

install_jdk_and_setup_JAVA_HOME(){
### jdk
sudo apt-get install openjdk-11-jdk -y

# # set JAVA_HOME
etc_profile_file='/etc/profile'
if ! grep -q JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 "$etc_profile_file"; then
echo -e "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64\n
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin\n
export JAVA_HOME\n
export JRE_HOME\n
export PATH\n"  >> $etc_profile_file
fi
}

install_docker(){
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo apt-get install docker-ce=5:20.10.3~3-0~ubuntu-focal docker-ce-cli=5:20.10.3~3-0~ubuntu-focal containerd.io -y

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

}

install_pygrid(){
sudo apt-get install python3-gi python3-xlib -y
cd /home/konrad/Linux-Setup-Script/libraries
git clone https://github.com/mjs7231/pygrid.git

cd pygrid && ./pygrid.py
}
