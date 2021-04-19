#!/bin/sh

# Install neovim
sudo pacman -Sy neovim

# Install pip
sudo pacman -Sy python-pip

# Install python neovim module
sudo pip3 install --upgrade pynvim

# Setup vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install rust
curl https://sh.rustup.rs -sSf | sh

# Install nightly rust
rustup install nightly

# Install RLS
rustup component add rls rust-analysis rust-src

# Install ripgrep
cargo install ripgrep

# Install NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Install Yarn
paru -S yarn

# Install Node with NVM
nvm install node
nvm use node

# Install neovim npm module globally
npm install -g neovim

# Install paru
sudo pacman -Sy paru

# Install instant markdown mini-server
npm install -g instant-markdown-d

# Setup git
git config --global user.name "Peter Farr"
git config --global user.email "Peter@PrismaPhonic.com"

# Install polybar
paru -S polybar

# Install powerline
paru -S powerline

# Install python neovim module
sudo pip3 install --upgrade pynvim

# Install Goland IDE
paru -S goland

# Install and setup docker
paru -S docker
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a pmfarr docker

# Install kubectl
paru -S kubectl

# Install Slack
paru -S slack-desktop

# Install neofetch for coolness factor
paru -S neofetch

# Install Thunderbird
paru -S thunderbird

# Install Golang & Percona
./install-mysql.sh

# Install newest kustomize
./install-kustomize.sh

# Install minikube & kvm deps
./install-minikube.sh

# Install operator-sdk deps
./install-operator-sdk-deps.sh
