#!/bin/bash

# declare STRING variables

# script body
apt-get update -y
apt-get upgrade -y

git config --global user.email "abramowski.konrad@gmail.com"
git config --global user.name "Konrad-Abramowski"

while read -r p; do sudo snap install $p ; done < <(cat << "EOF"
    spotify
    discord
    --classic code
    intellij-idea-ultimate --classic
    postman
    opera
EOF
)

while read -r p; do sudo apt-get install -y $p ; done < <(cat << "EOF"
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

### docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo apt-get install docker-ce=5:20.10.3~3-0~ubuntu-focal docker-ce-cli=5:20.10.3~3-0~ubuntu-focal containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

### pygrid https://github.com/pkkid/pygrid
sudo apt-get install git python3-gi python3-xlib -y
cd /home/konrad
git clone https://github.com/mjs7231/pygrid.git

# run pygrid on startup
touch /etc/rc.local

startup_script_file='/etc/rc.local'
if ! grep -q !/bin/bash "$startup_script_file"; then
echo -e "#!/bin/sh -e\n
xhost + local:\n
/usr/bin/python3 /home/konrad/pygrid/pygrid.py\n
exit 0" >> $startup_script_file
fi

sudo chmod +x /etc/rc.local

sudo update-rc.d startup-script.sh defaults

### set postion of displays
xrandr --output DP-0 --primary --rotate normal --mode 2560x1080 --pos 0x0 --rate 60
xrandr --output HDMI-0 --rotate right --mode 1920x1080 --pos 2560x-415 --rate 60

### add applications to favourites
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'opera_opera.desktop', 'chromium_chromium.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'code_code.desktop', 'postman_postman.desktop', 'spotify_spotify.desktop', 'pgadmin4.desktop', 'discord_discord.desktop']"

# run pygrid
cd /home/konrad
cd pygrid && ./pygrid.py