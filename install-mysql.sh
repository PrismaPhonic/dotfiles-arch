###################
## MARIADB SETUP ##
###################

# Install and setup mariadb
sudo pacman -S --noconfirm --needed mariadb
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
