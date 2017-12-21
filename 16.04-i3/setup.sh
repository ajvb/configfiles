# setup.sh for Ubuntu 16.04

# TODO:
#    1. Add cli opts for optionally including things (like dropbox)

cd ~

#
# Add all repos, update, and upgrade.
#

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable

# i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee -a /etc/apt/sources.list.d/sur5r-i3.list

# Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Update+Upgrade
sudo apt update -y
sudo apt upgrade -y

# Base install of packages
sudo apt install acpi \
 arandr \
 curl \
 evince \
 firefox \
 git \
 i3 \
 imagemagick \
 ipython \
 mpv \
 neovim \
 nitrogen \
 nmap \
 notify-osd \
 pasystray \
 postgresql-10 \
 postgresql-9.6 \
 postgresql-common \
 postgresql-contrib-10 \
 postgresql-contrib-9.6 \
 python-dev \
 python-pip \
 python3-dev \
 python3-pip \
 rofi \
 ruby \
 rxvt-unicode-256color \
 signal-desktop \
 silversearcher-ag \
 software-properties-common \
 spotify-client \
 tcpdump \
 thunar \
 tmux \
 transmission-gtk \
 unattended-upgrades \
 vim \
 wireshark \
 youtube-dl \
 xscreensaver

# Install dev services
# sudo apt install memcached redis-server redis-tools

# Install dropbox
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# cd -

# Install Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.2-amd64.deb
sudo dpkg -i slack-desktop-3.0.2-amd64.deb

# Install Mattermost
cd ~
wget https://releases.mattermost.com/desktop/3.7.1/mattermost-desktop-3.7.1-linux-x64.tar.gz
tar xvzf mattermost-desktop-3.7.1-linux-x64.tar.gz
rm mattermost-desktop-3.7.1-linux-x64.tar.gz

# Install keybase

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
