#!/bin/bash
# Defina os servidores DNS desejados
nameserver1="192.168.122.254"
sudo dnf update -y
sudo yum install -y -q yum-utils
curl https://releases.rancher.com/install-docker/24.0.9.sh | sh
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 777 /var/run/docker.sock

sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo setenforce 0
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config


# Crie um novo resolv.conf com os servidores DNS desejados
sudo bash -c "echo 'nameserver $nameserver1' > /etc/resolv.conf"
