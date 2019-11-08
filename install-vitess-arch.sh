##################
## GOLANG SETUP ##
##################
GOVERSION=1.12.9

sudo pacman -Syu
cd /tmp
wget https://dl.google.com/go/go${GOVERSION}.linux-amd64.tar.gz
sudo tar -C /usr/lib -xzf go${GOVERSION}.linux-amd64.tar.gz

# Setup workspace for golang stuff
mkdir -p ~/go/src

###################
## MARIADB SETUP ##
###################

# Install and setup mariadb
yay -S mariadb
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

##################
## VITESS SETUP ##
##################

go get -u github.com/kardianos/govendor

################
# Binary Build #
################

cd /tmp
git clone https://github.com/planetscale/vitess-releases.git
cd vitess-releases/bin
./install_latest.sh
cd -
