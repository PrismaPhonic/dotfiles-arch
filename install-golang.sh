##################
## GOLANG SETUP ##
##################
GOVERSION=1.16.3

sudo pacman -Syu
cd /tmp
wget https://dl.google.com/go/go${GOVERSION}.linux-amd64.tar.gz
sudo tar -C /usr/lib -xzf go${GOVERSION}.linux-amd64.tar.gz

# Setup workspace for golang stuff
mkdir -p ~/go/src
