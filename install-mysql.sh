###################
## PERCONA SETUP ##
###################

# Install and setup percona
sudo pacman -S percona-server libperconaserverclient percona-server-clients percona-toolkit
sudo systemctl start mysql.service
sudo systemctl enable mysql.service
