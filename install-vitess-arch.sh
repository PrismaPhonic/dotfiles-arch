##################
## GOLANG SETUP ##
##################

sudo pacman -Syu
sudo pacman -S go
sudo pacman -S go-tools

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

mkdir vitess-temp
cd vitess-temp
git clone https://github.com/planetscale/vitess-releases.git
cd vitess-releases/bin
./install_latest.sh
cd ../../../
rm -rf vitess-temp
