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

###################
## PERCONA SETUP ##
###################

# Install and setup percona
sudo pacman -S percona-server libperconaserverclient percona-server-clients percona-toolkit
sudo systemctl start mysql.service
sudo systemctl enable mysql.service
