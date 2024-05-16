#!/bin/bash
# Defina os servidores DNS desejados
nameserver1="192.168.100.254"

sudo dnf update
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Crie um novo resolv.conf com os servidores DNS desejados
sudo bash -c "echo 'nameserver $nameserver1' > /etc/resolv.conf"
