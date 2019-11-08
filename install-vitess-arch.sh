##################
## GOLANG SETUP ##
##################

sudo pacman -Syu
sudo pacman -S go

# Setup workspace for golang stuff
mkdir ~/code
mkdir ~/code/go

# Install gvm to manage multiple golang versions
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm

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
# SOURCE BUILD #
################

# UNCOMMENT IF CONTRIBUTING AND BUILD THIS WAY
# cd $GOPATH
# git clone https://github.com/vitessio/vitess.git \
#     src/vitess.io/vitess
# ln -s src/vitess.io ${HOME}/code/go/src/vitess.io
# cd ${HOME}/code/go/src/vitess.io/vitess

# Oddly enough I have to add this variable up-front due to a bug:
# https://github.com/vitessio/vitess/issues/4373
# BUILD_TESTS=0 ./bootstrap.sh

# unset PYTHONPATH
# ./bootstrap.sh

# source build.env
# source ./dev.env
# make build

####################
# END SOURCE BUILD #
####################

################
# Binary Build #
################

mkdir vitess-temp
cd vitess-temp
git clone https://github.com/planetscale/vitess-releases.git
cd vitess-releases/bin
./install_latest.sh
cd ../../../
sudo rm -r vitess-temp

# Install packages for testing
sudo apt install chromium-browser xvfb maven
