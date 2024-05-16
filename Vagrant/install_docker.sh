#!/bin/bash

#!/bin/bash

# Adiciona a chave GPG oficial do Docker:
sudo dnf install -y curl
sudo rpm --import https://download.docker.com/linux/centos/gpg

# Adiciona o repositório ao DNF:
echo \
  "deb [arch=$(uname -i)] https://download.docker.com/linux/centos/8/\$basearch/stable \
  $(rpm -E %centos) stable" | \
  sudo tee /etc/yum.repos.d/docker-ce.repo > /dev/null

sudo dnf makecache

# Instalação do Docker:
sudo dnf install docker-ce docker-ce-cli containerd.io -y

# Habilita o Docker Service:
sudo systemctl enable --now docker

# Adiciona o usuário ao grupo Docker:
sudo usermod -aG docker $USER

# Garante permissões para o socket do Docker:
sudo chmod 666 /var/run/docker.sock

ls -l /var/run/docker.sock

