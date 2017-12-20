# setup.sh for Ubuntu 16.04

# TODO:
#    1. Add cli opts for optionally including things (like dropbox)

cd ~

# Base install of packages
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade
sudo apt install vim \
 git \
 nitrogen \
 tmux \
 thunar \
 arandr \
 rxvt-unicode \
 xscreensaver \
 pasystray \
 acpi \
 curl \
 firefox \
 software-properties-common \
 neovim \
 python-dev \
 python-pip \
 python3-dev \
 python3-pip \
 unattended-upgrades \
 silversearcher-ag


# Install i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee -a /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3 rofi

# Install signal desktop
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Install spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client


# Install dropbox
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# cd -

# Install golang
mkdir -p ~/gocode
cd ~
wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz
rm go1.9.2.linux-amd64.tar.gz

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
mkdir -p ~/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~

# Install virtualenv
sudo pip3 install virtualenv virtualenvwrapper

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Enabled unattended upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Create some core folders
mkdir -p ~/Code/
mkdir -p ~/Pictures/Screenshots

# Install git utilities
mkdir -p ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# Place core configs
cd ~/configfiles/16.04-i3/; ./place.sh
cd ~
